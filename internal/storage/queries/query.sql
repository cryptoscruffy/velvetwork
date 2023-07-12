-- name: GetUserList :many
-- get all user ids
SELECT id FROM Users;

-- name: GetUser :one
-- get user info
SELECT * FROM Users WHERE id = $1;

-- name: GetProjectList :many
-- get all project ids
SELECT id FROM Projects;

-- name: GetUserProjects :many
-- gat all user's project ids
SELECT id FROM Projects WHERE owner = $1;

-- name: GetProject :one
-- get project info
SELECT * FROM Projects WHERE id = $1;

-- name: AddUser :exec
-- adds new user
INSERT INTO Users (id, nickname, description, nonce, registered, status,
                   tags, rating, account) VALUES($1, $2, $3, $4, $5, $6,
                                              $7, $8, $9);

-- name: UpdateUserNonce :exec
-- updates user's nonce
UPDATE Users SET nonce = $1 WHERE id=$2;

-- name: CreateProject :one
INSERT INTO Projects (title, description, tags, created, status, owner,
                      deadline, price) VALUES($1, $2, $3, $4, $5, $6, $7,
                      $8) RETURNING id;

-- name: UpdateProject :exec
UPDATE Projects SET title = $1, description = $2, tags = $3, deadline = $4,
                    price = $5 WHERE id = $6;

-- name: DeleteProject :exec
DELETE FROM Projects WHERE id = $1;

-- name: CreateBid :one
INSERT INTO Bids (project, contractor, price, deadline, message) VALUES($1, $2,
                  $3, $4, $5) RETURNING id;

-- name: GetBid :one
SELECT * FROM Bids WHERE id = $1;

-- name: GetProjectBids :many
SELECT id FROM Bids WHERE project = $1;

-- name: UpdateBid :exec
UPDATE Bids SET price = $1, deadline = $2, message = $3 WHERE id = $4;

-- name: DeleteBid :exec
DELETE FROM Bids WHERE id = $1;

-- name: AcceptBid :exec
UPDATE Projects SET price = Bids.price, deadline = Bids.deadline,
                    contractor=Bids.contractor, status = $1 FROM Bids
                WHERE Projects.id = Bids.project AND Bids.id = $2;

-- name: SetProjectStatus :exec
UPDATE Projects SET status = $1 WHERE id = $2;