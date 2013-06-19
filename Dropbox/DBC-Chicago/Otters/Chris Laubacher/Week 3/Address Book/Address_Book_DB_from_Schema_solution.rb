require 'sqlite3'

$db = SQLite3::Database.new "address_book.db"

class Contact
  def initialize(attrs)
    @first_name = attrs[:first_name]
    @last_name  = attrs[:last_name]
    @company = attrs[:company]
    @phone = attrs[:phone]
    @email = attrs[:email]
  end

  def save
    if id.empty?
      $db.execute(
      "INSERT INTO contacts(first_name, last_name, company, phone, email, created_at, updated_at)
      VALUES(?, ?, ?, ?, ?, DATETIME('now'), DATETIME('now'));", @first_name, @last_name, @company, @phone, @email)
    else
      $db.execute(
      "UPDATE contacts
      SET first_name = ?, last_name = ?, company = ?, phone = ?, email = ?, updated_at = DATETIME('now')
      WHERE id = ?;", @first_name, @last_name, @company, @phone, @email, id)
    end
  end

  def id
    $db.execute("SELECT id FROM contacts WHERE phone = ?;", @phone)
  end

  def add_to_group(group)
    $db.execute(
      "INSERT INTO contacts_groups(group_id, contact_id)
      VALUES(?, ?);", group.id, id)
  end

  def update(field, value)
    $db.execute(
    "UPDATE contacts
    SET #{field} = '#{value}', updated_at = DATETIME('now')
    WHERE id = ?;", id)
  end

  def delete
    $db.execute("DELETE FROM contacts_groups WHERE contact_id = ?;", id)
    $db.execute("DELETE FROM contacts WHERE id = ?;", id)
  end
end

class Group
  def initialize(name)
    @name = name
  end

  def id
    $db.execute("SELECT id FROM groups WHERE name = ?;", @name)
  end

  def save
    if id.empty?
      $db.execute("INSERT INTO groups(name) VALUES(?);", @name)
    else
      $db.execute("UPDATE groups SET name = ? WHERE id = ?;", @name, id)
    end
  end

  def delete
    $db.execute("DELETE FROM contacts_groups WHERE group_id = ?;", id)
    $db.execute("DELETE FROM groups WHERE id = ?;", id)
  end
end


tom = Contact.new(first_name: 'Tom', 
                  last_name: 'Jones', 
                  company: 'Dev Bootcamp', 
                  phone: '(312) 555-5560', 
                  email: 'tomjones@gmail.com')
sally = Contact.new(first_name: 'Sally', 
                  last_name: 'Smith', 
                  company: 'Dev Bootcamp', 
                  phone: '(312) 555-5561', 
                  email: 'ssmith@gmail.com')
tom.save
sally.save

friends = Group.new('friends')
friends.save

tom.add_to_group(friends)
sally.add_to_group(friends)

tom.update("email", "tjones@fakename.com")

tom.delete

friends.delete
