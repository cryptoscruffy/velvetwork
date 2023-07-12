// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.19.0

package storage

import (
	"database/sql"
)

type Bid struct {
	ID         int64          `db:"id" json:"id"`
	Project    sql.NullInt64  `db:"project" json:"project"`
	Contractor sql.NullString `db:"contractor" json:"contractor"`
	Price      sql.NullInt64  `db:"price" json:"price"`
	Deadline   sql.NullInt64  `db:"deadline" json:"deadline"`
	Message    sql.NullString `db:"message" json:"message"`
}

type Project struct {
	ID          int64          `db:"id" json:"id"`
	Title       sql.NullString `db:"title" json:"title"`
	Description sql.NullString `db:"description" json:"description"`
	Tags        sql.NullString `db:"tags" json:"tags"`
	Created     sql.NullTime   `db:"created" json:"created"`
	Status      sql.NullInt16  `db:"status" json:"status"`
	Owner       sql.NullString `db:"owner" json:"owner"`
	Contractor  sql.NullString `db:"contractor" json:"contractor"`
	Started     sql.NullTime   `db:"started" json:"started"`
	Deadline    sql.NullInt64  `db:"deadline" json:"deadline"`
	Price       sql.NullInt64  `db:"price" json:"price"`
}

type Rate struct {
	ID       int64          `db:"id" json:"id"`
	Fromuser sql.NullString `db:"fromuser" json:"fromuser"`
	Project  sql.NullInt64  `db:"project" json:"project"`
	Touser   sql.NullString `db:"touser" json:"touser"`
	Rate     sql.NullInt16  `db:"rate" json:"rate"`
	Message  sql.NullString `db:"message" json:"message"`
}

type User struct {
	ID          string          `db:"id" json:"id"`
	Nickname    sql.NullString  `db:"nickname" json:"nickname"`
	Description sql.NullString  `db:"description" json:"description"`
	Nonce       sql.NullInt64   `db:"nonce" json:"nonce"`
	Registered  sql.NullTime    `db:"registered" json:"registered"`
	Status      sql.NullInt16   `db:"status" json:"status"`
	Tags        sql.NullString  `db:"tags" json:"tags"`
	Rating      sql.NullFloat64 `db:"rating" json:"rating"`
	Account     sql.NullInt64   `db:"account" json:"account"`
}