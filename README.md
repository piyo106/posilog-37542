# テーブル設計

## goalsテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| title   | string  | null: false |
| purpose | string  | null: false |
| tag_id  | integer | null: false |

### Association

- has_many :logs

### ActiveHashを用いたAssociation

- belongs_to :tag

## logテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| goal        | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |

### Association

- belongs_to :goal

### ActiveHashを用いたAssociation

- belongs_to :category
