require 'mongo'
require 'bson'

Mongo::Logger.logger.level = Logger::FATAL

class Contacts
  # { :id, :name, :email } - поля хранимых контактов
  def initialize(client)
    @client = client
  end

  def all
    @client[:contacts].find
  end

  def create(contact_name, email)
    @client[:contacts].insert_one({ name: contact_name, email: email })
  end
end
