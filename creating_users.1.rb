# Creates user accounts first
500.times do |i|
  user = User.create(:email => "email_#{50 + i}@gmail.com", :password => "mypassword", :password_confirmation => "mypassword")
end

# Creates random skills
def get_me_skills
  skills = ['css3', 'adminstracion', 'html5', 'photoshop', 'dreamweaver', 'wordpress', 'ruby on rails', 'ruby', 'java', 'c++',
            'agile project management', 'jquery', 'mootools', 'node.js']
<<<<<<< HEAD

  my_tags = Array.new

  0.upto(1 + rand(4)) do
    my_tags << skills[rand(13)]
  end

=======
  
  my_tags = Array.new
  
  0.upto(1 + rand(4)) do
    my_tags << skills[rand(13)] 
  end
  
>>>>>>> 57dd45ffec0989aae7fede2c3f152c731979a753
  my_tags.join(',')
end


# Creates random names
def get_me_a_name
  names = ['Roberto', 'Juan', 'Robert', 'Nancy', 'Lucia', 'Armando', 'Rodrigo', 'Joshua']
  last_names = ['Francia', 'Ramirez', 'Juanes', 'Smith', 'Rodriguez', 'Amed', 'Duarte', 'Colina']
<<<<<<< HEAD

=======
  
>>>>>>> 57dd45ffec0989aae7fede2c3f152c731979a753
  "#{names[rand(7)]} #{last_names[rand(7)]}"
end

# Relates all profiles to existing users
User.all.each do |user|
  profile = user.build_profile(:position => Position.find(1+rand(8)), :user_id => user.id, :name => get_me_a_name, :motto => "My work is my life", :status => "1", :published => true, :city_id => 1, :skill_list => get_me_skills)
  profile.save
<<<<<<< HEAD
end
=======
end
>>>>>>> 57dd45ffec0989aae7fede2c3f152c731979a753
