-- 코드를 입력하세요
# SET @VAR = -10000;

# SELECT (@VAR := @VAR + 10000) AS PRICE_GROUP,
#     (SELECT COUNT(*) FROM PRODUCT
#      WHERE PRICE < @VAR + 10000
#         AND PRICE >= @VAR)
#      AS PRODUCTS
#     FROM PRODUCT
#     WHERE @VAR < (SELECT MAX(PRICE) FROM PRODUCT)
    
SELECT FLOOR(PRICE/10000) * 10000 AS PRICE_GROUP, COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY FLOOR(PRICE/10000)*10000
ORDER BY 1