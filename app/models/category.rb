class Category < ActiveRecord::Base
  has_many :toy_categories
  has_many :toys, :through =>:toy_categories

  def self.create_categories
    self.create(:name=>"Action Figures")
    self.create(:name=>"Arts and Crafts")
    self.create(:name=>"Baby and Toddler Toys")
    self.create(:name=>"Dolls and Accessories")
    self.create(:name=>"Dress Up and Pretend Play")
    self.create(:name=>"Educational and STEM Toys")
    self.create(:name=>"Games")
    self.create(:name=>"Grown-Up Toys")
    self.create(:name=>"Hobbies")
    self.create(:name=>"Lego and Building Toys")
    self.create(:name=>"Movie and TV Toys")
    self.create(:name=>"Preschool")
    self.create(:name=>"Puzzles")
    self.create(:name=>"Ride Ons")
    self.create(:name=>"Sports and Outdoor Play")
    self.create(:name=>"Stuffed Animals")
    self.create(:name=>"Video Games")
  end

  def self.list_categories
    Category.create_categories if Category.all.empty?
    @list_categories = Category.all
  end

 end
