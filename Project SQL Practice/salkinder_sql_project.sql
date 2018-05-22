/* Welcome to the SQL mini project. For this project, you will use
Springboard' online SQL platform, which you can log into through the
following link:

https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

Note that, if you need to, you can also download these tables locally.

In the mini project, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */



/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. 

name
Badminton Court
Table Tennis
Snooker Table
Pool Table

*/
SELECT count(name)
FROM `Facilities` 
WHERE `membercost` = 0.0

/* Q2: How many facilities do not charge a fee to members? 
4   
*/
SELECT count(name)
FROM `Facilities` 
WHERE `membercost` = 0.0

/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT `facid`,
       `name`,
       `membercost`,
       `monthlymaintenance`
FROM `Facilities` 
WHERE `membercost` < `monthlymaintenance` * 0.2
AND `membercost` != 0.0


/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */
SELECT * 
FROM `Facilities` 
WHERE `facid` BETWEEN 1 AND 5
AND `facid` NOT BETWEEN 2 AND 4

/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */
SELECT `name`,
	   `monthlymaintenance`,
       CASE WHEN `monthlymaintenance` > 100 THEN 'expensive'
            ELSE 'cheap' END AS cheap_expensive
FROM `Facilities`


/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */
SELECT `firstname`,
	   `surname` as lastname,
       MAX(joindate)
FROM `Members`
WHERE `surname` != 'GUEST'

/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */
SELECT fac.name,
	   CONCAT(memb.firstname, ' ', memb.surname) AS fullname
FROM `Bookings` book
JOIN `Members` memb
    ON book.memid = memb.memid
JOIN `Facilities` fac
    ON book.facid = fac.facid
WHERE memb.memid != '0'
AND fac.name = 'Tennis Court 1' OR fac.name = 'Tennis Court 2'
GROUP BY fullname
ORDER BY fullname


/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */
SELECT fac.name,
	   CONCAT(memb.firstname, ' ', memb.surname) AS fullname,
        CASE WHEN memb.memid = 0 THEN book.slots * fac.guestcost
        ELSE book.slots * fac.membercost  END AS cost
FROM `Bookings` book
JOIN `Members` memb
    ON book.memid = memb.memid
JOIN `Facilities` fac
    ON book.facid = fac.facid
WHERE book.starttime LIKE '2012-09-14%'
AND CASE WHEN memb.memid = 0 THEN book.slots * fac.guestcost
    WHEN memb.memid !=0 THEN book.slots * fac.membercost
	ELSE NULL END >30
ORDER BY cost DESC


/* Q9: This time, produce the same result as in Q8, but using a subquery. */
SELECT sub.facility as facility,
	   sub.fullname as fullname,
       sub.cost as totalcost
  FROM (
      SELECT fac.name as facility,
      		CONCAT(memb.firstname, ' ', memb.surname) AS fullname,
            CASE WHEN memb.memid = 0 THEN book.slots * fac.guestcost
            ELSE book.slots * fac.membercost  END AS cost
        FROM `Bookings` book
        JOIN `Members` memb
            ON book.memid = memb.memid
        JOIN `Facilities` fac
            ON book.facid = fac.facid 
       WHERE book.starttime LIKE '2012-09-14%' 
  		) sub
WHERE sub.cost > 30
ORDER BY totalcost DESC

/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

-- Assuming three months of data as per the booking data (July - Sept of 2012)

SELECT sub.facility as facility,
       sub.fac_rev - sub.initialoutlay - (3*sub.monthlymaintenance) as totalrev
  FROM (
      SELECT fac.name as facility,
             fac.initialoutlay as initialoutlay,
             fac.monthlymaintenance as monthlymaintenance,
            CASE WHEN memb.memid = 0 THEN sum(book.slots * fac.guestcost)
            ELSE sum(book.slots * fac.membercost)  END AS fac_rev
        FROM `Bookings` book
        JOIN `Members` memb
            ON book.memid = memb.memid
        JOIN `Facilities` fac
            ON book.facid = fac.facid 
        GROUP BY facility
  		) sub
WHERE sub.fac_rev - sub.initialoutlay - (3*sub.monthlymaintenance) < 1000
GROUP BY facility
ORDER BY totalrev DESC


