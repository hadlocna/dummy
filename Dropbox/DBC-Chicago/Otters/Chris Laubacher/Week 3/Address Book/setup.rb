require 'sqlite3'

$db = SQLite3::Database.new "address_book.db"

module AddressBook
  def self.setup
    $db.execute(
      "CREATE TABLE contacts (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      first_name VARCHAR(64) NOT NULL,
      last_name VARCHAR(64) NOT NULL,
      company VARCHAR(64) NOT NULL,
      phone VARCHAR(64) NOT NULL,
      email VARCHAR(64) UNIQUE NOT NULL,
      created_at DATETIME NOT NULL,
      updated_at DATETIME NOT NULL );" )
    $db.execute(
      "CREATE TABLE groups (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL );" )
    $db.execute(
      "CREATE TABLE contacts_groups (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      contact_id INTEGER,
      group_id INTEGER);" )
  end

  def self.seed
    $db.execute(
      "INSERT INTO contacts 
       (first_name, last_name, company, phone, email, created_at, updated_at)
       VALUES
       ('Brick','Thornton', 'Dev Bootcamp', '(312) 555-5556', 'bthorton@gmail.com', DATETIME('now'), DATETIME('now')),
       ('Chris','Laubacher','Dev Bootcamp', '(312) 555-5557', 'claubacher@fakename.com', DATETIME('now'), DATETIME('now')),
       ('Patrick','Villanueva','Dev Bootcamp', '(312) 555-5558', 'villanuv@fakename.com', DATETIME('now'), DATETIME('now'));")
    $db.execute(
      "INSERT INTO groups 
       (name)
       VALUES
       ('awesome people');")
  end

  def self.make_groups
    $db.execute(
      "INSERT INTO contacts_groups
      (group_id, contact_id)
      VALUES
      (1, 2),
      (1, 3);")
  end
end

AddressBook.setup
AddressBook.seed
AddressBook.make_groups

