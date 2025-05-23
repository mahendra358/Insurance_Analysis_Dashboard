--  
	
    -- new_target
SELECT SUM(new_budget) AS new_target
FROM individual_budget;

-- new_achieved
SELECT
    SUM(Amount) AS new_achieved
FROM Append
WHERE income_class = 'New';
	
    -- new_invoice
SELECT
    SUM(Amount) AS new_invoice
FROM invoice
WHERE income_class = 'New';



-- Cross_sell

-- Cross_sell_Target
SELECT SUM(Cross_sell_bugdet
) AS Cross_sell_target
FROM individual_budget;


--  cross_sell_achieved
SELECT
    SUM(Amount) AS cross_sell_achieved
FROM Append
WHERE income_class = 'cross sell';

-- cross_sell_invoice
SELECT
    SUM(Amount) AS cross_sell_invoice
FROM invoice
WHERE income_class = 'cross sell';

-- Renewal

--  renewal_target
SELECT SUM(Renewal_Budget
) AS renewal_target
FROM individual_budget;

--  renewal_achieved
SELECT
    SUM(Amount) AS renewal_achieved
FROM Append
WHERE income_class = 'renewal';

SELECT
    SUM(Amount) AS renewal_invoice
FROM invoice
WHERE income_class = 'renewal';


-- New Placed Achievement %
SELECT
    ROUND(
        (SELECT SUM(Amount) FROM Append WHERE income_class = 'New') * 100.0 /
        NULLIF((SELECT SUM(new_budget) FROM Individual_Budget), 0), 2
    ) + '%'AS new_placed_achievement_percentage;
    
    
    
    --   cross_sell_placed_achievement_percentage
SELECT
    
        ROUND(
            (SELECT SUM(Amount) FROM Append WHERE income_class = 'Cross Sell') * 100.0 /
            NULLIF((SELECT SUM(Cross_sell_bugdet) FROM Individual_Budget), 0), 2
        ) AS 
       cross_sell_placed_achievement_percentage;
       select * from individual_budget;
       
       
       
       -- renewal_placed_achievement_percentage
		SELECT

        ROUND(
            (SELECT SUM(Amount) FROM Append WHERE income_class = 'Renewal') * 100.0 /
            NULLIF((SELECT SUM(Renewal_budget) FROM Individual_Budget), 0), 2
        )  AS renewal_placed_achievement_percentage;

       
       
       
       -- new_invoice_achievement_percentage
	SELECT
    
        ROUND(
            (SELECT SUM(Amount) FROM invoice WHERE income_class = 'New') * 100.0 /
            NULLIF((SELECT SUM(new_budget) FROM Individual_Budget), 0), 2
        ) AS new_invoice_achievement_percentage;	
       
       
       -- cross_sell_invoice_achievement_percentage
        SELECT
    
        ROUND(
            (SELECT SUM(Amount) FROM invoice WHERE income_class = 'Cross Sell') * 100.0 /
            NULLIF((SELECT SUM(cross_sell_bugdet) FROM Individual_Budget), 0), 2
        ) AS cross_sell_invoice_achievement_percentage;
        
	
    -- renewal_invoice_achievement_percentage
    SELECT
    
        ROUND(
            (SELECT SUM(Amount) FROM invoice WHERE income_class = 'Renewal') * 100.0 /
            NULLIF((SELECT SUM(renewal_budget) FROM Individual_Budget), 0), 2
        ) AS renewal_invoice_achievement_percentage;
        
SELECT
    account_executive,
    COUNT(CASE WHEN income_class = 'Cross Sell' THEN invoice_number END) AS cross_sell_count,
    COUNT(CASE WHEN income_class = 'New' THEN invoice_number END) AS new_count,
    COUNT(CASE WHEN income_class = 'Renewal' THEN invoice_number END) AS renewal_count,
    COUNT(invoice_number) AS grand_total
FROM invoice
GROUP BY account_executive
ORDER BY account_executive;
-- select * from invoice;


-- account_executive wise invoice count
SELECT
    account_executive,
    income_class,
    COUNT(invoice_number) AS invoice_count
FROM invoice
GROUP BY Account_Executive, income_class
ORDER BY Account_Executive, income_class;




-- opportunity_name Total Revenue
	SELECT
    opportunity_name,
    SUM(revenue_amount) AS total_revenue
FROM Opportunity
GROUP BY opportunity_name
ORDER BY total_revenue DESC;



-- product_group wise  opportunity_count
SELECT
    product_group,
    COUNT(opportunity_name) AS opportunity_count
FROM Opportunity
GROUP BY product_group
ORDER BY opportunity_count DESC;



SELECT
    stage,
    SUM(revenue_amount) AS total_revenue
FROM Opportunity
GROUP BY stage
ORDER BY total_revenue DESC;









