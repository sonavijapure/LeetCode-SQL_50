/* the names of the customer that are not referred by the customer with id = 2. */
select name from customer where coalesce(referee_id,0) <> 2;