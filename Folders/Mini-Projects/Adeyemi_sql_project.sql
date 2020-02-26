
/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */
SELECT *
FROM  `Facilities`
WHERE  `membercost` >0
LIMIT 0 , 30

/* Q2: How many facilities do not charge a fee to members? */
SELECT *
FROM  `Facilities`
WHERE  `membercost` =0
LIMIT 0 , 30

/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT  `facid` ,  `name` ,  `membercost` ,  `guestcost` ,  `initialoutlay` ,  `monthlymaintenance`
FROM  `Facilities`
WHERE  `membercost` >0
AND  `membercost` /  `monthlymaintenance` < 0.2
LIMIT 0 , 30

/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */
SELECT *
FROM  `Facilities`
WHERE  `facid`
IN ( 1, 5 )
LIMIT 0 , 30

/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */
SELECT  `name` ,  `monthlymaintenance` ,
CASE WHEN  `monthlymaintenance` >100
THEN  'expensive'
ELSE  "cheap"
END
FROM  `Facilities`
LIMIT 0 , 30

/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */
select firstname, surname
FROM Members
WHERE joindate = (
SELECT MAX( joindate ) )


/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */
SELECT concat (name, firstname, surname)
FROM Bookings
INNER JOIN Facilities ON Bookings.facid = Facilities.facid
AND name LIKE  'Tennis Court%'
INNER JOIN Members ON Bookings.memid = Members.memid
GROUP BY name, firstname, surname
ORDER BY name

/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */
SELECT  name,concat( firstname ,surname),
CASE WHEN Bookings.memid =0
THEN Facilities.guestcost * Bookings.slots
ELSE Facilities.membercost * Bookings.slots
END AS cost
FROM Bookings
INNER JOIN Facilities ON Bookings.facid = Facilities.facid
AND Bookings.starttime LIKE  '2012-09-14%'
AND (((Bookings.memid =0) AND (Facilities.guestcost * Bookings.slots >30))
OR ((Bookings.memid !=0) AND (Facilities.membercost * Bookings.slots >30)))
INNER JOIN Members ON Bookings.memid = Members.memid
ORDER BY cost DESC

/* Q9: This time, produce the same result as in Q8, but using a subquery. */
SELECT *
FROM (
SELECT  name,concat( firstname ,surname),
CASE WHEN Bookings.memid =0
THEN Facilities.guestcost * Bookings.slots
ELSE Facilities.membercost * Bookings.slots
END AS cost
FROM Bookings
INNER JOIN Facilities ON Bookings.facid = Facilities.facid
AND Bookings.starttime LIKE  '2012-09-14%'
INNER JOIN Members ON Bookings.memid = Members.memid
)sub
WHERE sub.cost >30
ORDER BY sub.cost DESC

/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */


SELECT *
FROM (
SELECT sub.facility, SUM( sub.cost ) AS total_revenue
FROM (
SELECT Facilities.name AS facility,
CASE WHEN Bookings.memid =0
THEN Facilities.guestcost * Bookings.slots
ELSE Facilities.membercost * Bookings.slots
END AS cost
FROM Bookings
INNER JOIN Facilities ON Bookings.facid = Facilities.facid
INNER JOIN Members ON Bookings.memid = Members.memid
)sub
GROUP BY sub.facility
)sub2
WHERE sub2.total_revenue <1000
