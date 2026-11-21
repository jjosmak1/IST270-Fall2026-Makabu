
-- IST 270 Week 12b: The Event Management JOIN

-- 1. Inspect the data
SELECT * FROM Venues ORDER BY VenueID;

SELECT * FROM Events ORDER BY EventID;

SELECT * FROM Attendees ORDER BY AttendeeID;

SELECT * FROM Registrations ORDER BY RegistrationID;


-- 2. Join events to venues
SELECT e.EventName, e.EventDate, v.VenueName, v.City
FROM Events AS e
INNER JOIN Venues AS v ON e.VenueID = v.VenueID;


-- 3. Compare INNER JOIN and LEFT JOIN

SELECT a.FirstName, a.LastName, r.RegistrationID
FROM Attendees AS a
INNER JOIN Registrations AS r ON a.AttendeeID = r.AttendeeID;

SELECT a.FirstName, a.LastName, r.RegistrationID
FROM Attendees AS a
LEFT JOIN Registrations AS r ON a.AttendeeID = r.AttendeeID;

-- There are more result rows than distinct attendees because
-- Alice Johnson has two registrations. LEFT JOIN also keeps
-- Eve Holt, who has no registration, and displays NULL.


-- 4. Chain joins: Global Tech Summit
SELECT a.FirstName, a.LastName, e.EventName
FROM Attendees AS a
INNER JOIN Registrations AS r ON a.AttendeeID = r.AttendeeID
INNER JOIN Events AS e ON r.EventID = e.EventID
WHERE e.EventName = 'Global Tech Summit';


-- 5. Question 1: Which venue has no events?
SELECT v.VenueName, v.City
FROM Venues AS v
LEFT JOIN Events AS e ON v.VenueID = e.VenueID
WHERE e.EventID IS NULL;


-- 5. Question 2: Which events is Alice Johnson registered for?
SELECT a.FirstName, a.LastName, e.EventName
FROM Attendees AS a
INNER JOIN Registrations AS r ON a.AttendeeID = r.AttendeeID
INNER JOIN Events AS e ON r.EventID = e.EventID
WHERE a.FirstName = 'Alice'
AND a.LastName = 'Johnson';


-- 5. Question 3: Complete registration list
SELECT
    a.FirstName || ' ' || a.LastName AS AttendeeName,
    e.EventName,
    v.VenueName
FROM Registrations AS r
INNER JOIN Attendees AS a ON r.AttendeeID = a.AttendeeID
INNER JOIN Events AS e ON r.EventID = e.EventID
INNER JOIN Venues AS v ON e.VenueID = v.VenueID;
