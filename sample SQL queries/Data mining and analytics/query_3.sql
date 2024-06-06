SELECT count(ad_id)*quantity as total_ads, AdProviders.ap_id,
	DENSE_RANK( ) OVER ( 
	ORDER BY count(ad_id)*quantity DESC
	) ads_quantity_rank 
FROM ads 
JOIN AdProviders on ads.ap_id = AdProviders.ap_id 
GROUP BY AdProviders.ap_id;