```mongodb
1.
[
  {
    $project: {
      user: 1,
      retweet_count: 1
    }
  },
  {
    $sort: {
      retweet_count: -1
    }
  },
  {
    $limit: 10
  },
  {
    $sort: {
      retweet_count: -1
    }
  }
]

1.1
{
  _id: "$user.id_str",
  total_retweets: { $sum: "$retweet_count" },
  lista: {
    $addToSet: {
      tweet_id: "$_id",
      country: "$country"
    }
  }
}


2.
[
  {
    $unwind: {
      path: "$hashtags"
    }
  },
  {
    $group: {
      _id: "$hashtags.text",
      cantidad: {
        $count: {}
      }
    }
  },
  {
    $sort: {
      cantidad: -1
    }
  },
  {
    $limit: 5
  }
]

3.
[
  {
    $unwind:
      {
        path: "$user_mentions"
      }
  },
  {
    $group: {
      _id: "$user_mentions.id",
      menciones: {
        $count: {}
      }
    }
  },
  {
    $sort: {
      menciones: -1
    }
  },
  {
    $limit: 5
  }
]

4.
[
  {
    $group: {
      _id: {
        $cond: {
          if: {
            $eq: ["$country", "Argentina"]
          },
          then: "Argentina",
          else: "Otros"
        }
      },
      retweets_promedios: {
        $avg: "$retweet_count"
      }
    }
  }
]

5.
[
  {
    $group: {
      _id: "$user.id_str",
      tweets: {
        $push: "$_id"
      },
      largo: {
        $count: {}
      }
    }
  }
]

6.
[
  {
    $group: {
      _id: "$user.id_str",
      retweets: {
        $sum: "$retweet_count"
      }
    }
  },
  {
    $sort:
      {
        retweets: -1
      }
  },
  {
    $limit: 1
  }
]
```