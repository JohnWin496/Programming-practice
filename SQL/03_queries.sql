-- Query 1: The business may need to view the customer details: full name,
-- contact details, the device brought in for repair, and the current repair
-- status of the devices.
SELECT
    c.FirstName || ' ' || c.LastName "Full Name",
    c.Phone_number,
    d.Device_Type,
    r.Repair_ID,
    r.Repair_Description,
    r.Request_date,
    r.Repair_status
FROM CUSTOMER c, DEVICE d, REPAIR_REQUEST r
WHERE c.Customer_ID=r.CUSTOMERCustomer_ID AND r.DEVICEDevice_ID=d.Device_ID
ORDER BY r.Request_date DESC;

-- Query 2: Finding out which customers submit the most repair requests.
-- This can give the business opportunities to perform loyal benefits and etc.
SELECT
    c.Customer_ID,
    c.FirstName || ' ' || c.LastName "Full name",
    COUNT(r.Repair_ID) AS Total_Repairs
FROM CUSTOMER c, REPAIR_REQUEST r
WHERE c.Customer_ID=r.CUSTOMERCustomer_ID
GROUP BY c.Customer_ID, c.FirstName, c.LastName
ORDER BY Total_Repairs DESC;

-- Query 3: Finding out which services are used most often. This type of data
-- can either help the business manage financials better and make executive
-- decisions concerning with expending the quality of the services for the future.
SELECT
    s.Service_Description,
    COUNT(rs.SERVICEService_ID) AS Total_Performed
FROM SERVICE s, REPAIR_SERVICE rs
WHERE s.Service_ID = rs.SERVICEService_ID
GROUP BY s.Service_Description
ORDER BY Total_Performed DESC;

-- Query 4: This query helps the business view the repair information by showing
-- the services and parts used for each repair request. It also shows the device
-- model, allowing the business to track the device model repair patterns and be
-- able to calculate the warranty. The number of parts used are also taken into
-- account along with the services used for the respective repairs.
SELECT
    r.Repair_ID,
    d.Device_Model,
    s.Service_Description,
    p.Part_Description,
    sp.Parts_used
FROM REPAIR_REQUEST r,
    DEVICE d,
    REPAIR_SERVICE rs,
    SERVICE s,
    SERVICE_PART sp,
    PART p
WHERE r.DEVICEDevice_ID = d.Device_ID
AND r.Repair_ID = rs.REPAIR_REQUESTRepair_ID
AND rs.SERVICEService_ID = s.Service_ID
AND s.Service_ID = sp.SERVICEService_ID
AND sp.PARTPart_ID = p.Part_ID
ORDER BY r.Repair_ID;

-- Query 5: The total amount each customer have paid for repair and their most
-- services used.
SELECT
    c.Customer_ID,
    c.FirstName || ' ' || c.LastName AS Customer_Name,
    s.Service_Description,
    COUNT(s.Service_ID) AS Times_Used,
    SUM(s.Charge) AS Total_Amount_Paid
FROM CUSTOMER c,
    REPAIR_REQUEST r,
    REPAIR_SERVICE rs,
    SERVICE s
WHERE c.Customer_ID = r.CUSTOMERCustomer_ID
AND r.Repair_ID = rs.REPAIR_REQUESTRepair_ID
AND rs.SERVICEService_ID = s.Service_ID
GROUP BY c.Customer_ID, c.FirstName, c.LastName, s.Service_Description
ORDER BY c.Customer_ID, Times_Used DESC;

-- Query 6: Finding out which services consume the most expensive parts is
-- important to take account of when planning to order more parts for services.
SELECT
    s.Service_Description AS "Service",
    SUM(p.Part_Cost * sp.Parts_used) AS "Total Parts Cost"
FROM SERVICE s,
    SERVICE_PART sp,
    PART p
WHERE s.Service_ID = sp.SERVICEService_ID
AND sp.PARTPart_ID = p.Part_ID
GROUP BY s.Service_Description
ORDER BY "Total Parts Cost" DESC;
