# -- 코드를 입력하세요
# SELECT CAR_ID,
#         CASE WHEN 2022-10-16 BETWEEN START_DATE AND END_DATE THEN '대여중'
#         ELSE '대여가능'
#         END AS 'AVAILABILITY'
#     FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
#     GROUP BY CAR_ID
#     ORDER BY CAR_ID DESC

SELECT C.CAR_ID, IF(R.AVAILABILITY IS NULL, '대여 가능', R.AVAILABILITY) AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY C
    LEFT OUTER JOIN (SELECT CAR_ID, IF('2022-10-16' BETWEEN START_DATE AND END_DATE, '대여중', '대여 가능') AS AVAILABILITY
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    HAVING AVAILABILITY = '대여중') R
ON C.CAR_ID = R.CAR_ID
GROUP BY CAR_ID
ORDER BY CAR_ID DESC