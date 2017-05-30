== README

* Database creation

Users

| Column     | Type        | Options                               |
|:-----------|------------:|:-------------------------------------:|
| name       | string      | null:false, unique:true, add_index    |

devise_for :users
has_many :groups, through: :groups_users
has_many :groups_users
has_many :messages

Groups_Users

| Column     | Type        | Options                                    |
|:-----------|------------:|:------------------------------------------:|
| user_id    | integer     | null:false, foreign_key :true, add_index   |
| group_id   | integer     | null:false, foreign_key :true, add_index   |

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

| Column     | Type        | Options                                     |
|:-----------|------------:|:-------------------------------------------:|
| text       | text        |                                             |
| image      | string      |                                             |
| user_id    | references  | null:false ,foreign_key :true, add_index    |
| group_id   | references  | null:false ,foreign_key :true, add_index    |

belongs_to :user
belongs_to :group
