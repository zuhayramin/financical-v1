Select u.user_id, u.name FROM UserInfo u;
#Deletes a user, if user is owner also deletes all business
# related info and transactions using CASCADES
DELETE FROM UserInfo u WHERE u.user_id = 1;
Select u.user_id, u.name FROM UserInfo u;