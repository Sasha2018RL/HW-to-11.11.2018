require 'mongo'
require 'bson'

Mongo::Logger.logger.level = Logger::FATAL

class Posts
  # { :id, :name, :email } - поля хранимых контактов
  def initialize
    @client = Mongo::Client.new(['rpiserver.tk'], database: 'blog')
  end

  def all
    @client[:posts].find
  end

  def create(title, text)
    @client[:posts].insert_one({ title: title, text: text })
  end

  def find(faq_id)
    @client[:posts].find({ _id: BSON::ObjectId(faq_id) }).first
  end
end