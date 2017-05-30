== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation


Users

| Column     | Type        | Options                        |
|:-----------|------------:|:------------------------------:|
| id         | integer     | null:false                     |
| name       | string      | null:false, unique:true        |
| adress     | string      | null:false, unique:true        |
| password   | string      | null:false                     |

has_many :groups, through: :group_users
has_many :group_users
has_many :messages

Group_Users

| Column     | Type        | Options                         |
|:-----------|------------:|:-------------------------------:|
| id         | integer     | null:false                      |
| user_id    | integer     | null:false, foreign_key :true   |
| group_id   | integer     | null:false, foreign_key :true   |

belongs_to :user
belongs_to :group

Gruops

| Column     | Type        | Options                         |
|:-----------|------------:|:-------------------------------:|
| id         | integer     | null:false                      |
| name       | string      | null:false                      |
| user_id    | references  | null:false, foreign_key :true   |

has_many :users, through: through: :group_users
has_many :group_users


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

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
