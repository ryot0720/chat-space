== README

* Database creation

Users

| Column     | Type        | Options                        |
|:-----------|------------:|:------------------------------:|
| id         | integer     | null:false                     |
| name       | string      | null:false, unique:true        |
| adress     | string      | null:false, unique:true        |
| password   | string      | null:false                     |

has_many :groups, through: :groups_users
has_many :groups_users
has_many :messages

Groups_Users

| Column     | Type        | Options                         |
|:-----------|------------:|:-------------------------------:|
| id         | integer     | null:false                      |
| user_id    | integer     | null:false, foreign_key :true   |
| group_id   | integer     | null:false, foreign_key :true   |

belongs_to :user
belongs_to :group

Groups

| Column     | Type        | Options                         |
|:-----------|------------:|:-------------------------------:|
| id         | integer     | null:false                      |
| name       | string      | null:false                      |

has_many :users, through: :groups_users
has_many :groups_users
has_many :messages


Messages

| Column     | Type        | Options                         |
|:-----------|------------:|:-------------------------------:|
| id         | integer     | null:false                      |
| text       | text        |                                 |
| image      | string      |                                 |
| created_at | datetime    | null:false                      |
| updated_at | datetime    | null:false                      |
| user_id    | references  | null:false ,foreign_key :true   |
| group_id   | references  | null:false ,foreign_key :true   |

belongs_to :users
belongs_to :group
