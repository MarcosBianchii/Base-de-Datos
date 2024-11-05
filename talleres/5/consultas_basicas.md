```mongodb
1.
{ user_id: "818839458" }

2.
{ retweet_count: { $gt: 500000 } }

3.
{ country: { $in: ["Argentina", "Brasil"] } }

4.
{
	$and: [
		{retweet_count: {$gte: 200000}},
  	    {lang: "es"},
	]
}

5.
{
  	$and: [
		{ country: { $nin: ["Argentina", "Brasil"] } },
    	{ country: { $exists: true } },
    	{ lang: "es" },
	]
}
{ retweet_count: 1 }

6.
{ "user.name": /Juan/ }
{ "user.screen_name": "$user.screen_name" }

7.
{ user: 1, retweet_count: 1 }
{ retweet_count: -1 }
10
```