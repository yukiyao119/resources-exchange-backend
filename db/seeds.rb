Review.destroy_all
Exchange.destroy_all 
UserSkillExchange.destroy_all
UserSkill.destroy_all
Skill.destroy_all
User.destroy_all

Review.reset_pk_sequence
Exchange.reset_pk_sequence 
UserSkillExchange.reset_pk_sequence
UserSkill.reset_pk_sequence 
Skill.reset_pk_sequence
User.reset_pk_sequence 


skill1 = Skill.create(name: "Javascript")
skill2 = Skill.create(name: "Drum")
skill3 = Skill.create(name: "Mandarin")
skill4 = Skill.create(name: "Photography")
skill5 = Skill.create(name: "React")
skill6 = Skill.create(name: "Yoga")
skill7 = Skill.create(name: "Acting")
skill8 = Skill.create(name: "Massage")

# user Yuki, prospect park
user1 = User.create(username: "yukiyao", password: "111", displayname: "Yuki", donated_hour: 2, time_slot: "weekend", location: "Prospect park", img: "https://www.pinterest.com/pin/33988172171833984/", bio: 'first bio', lat: 40.663610, lng: -73.977640)

# user dan, Williamsburg
user2 = User.create(username: "dangrammer", password: "111", displayname: "Dan", donated_hour: 2, time_slot: "Thursday", location: "Williamsburg", img: "https://www.pinterest.com/pin/33988172171833984/", bio: "Who's param?", lat: 40.692532, lng: -73.990997)

# user alex, harlem
user3 = User.create(username: "alex", password: "111", displayname: "Alex", donated_hour: 3, time_slot: "Friday", location: "Harlem", img: "https://www.pinterest.com/pin/33988172171833984/", bio: 'I bike everyday!', lat: 40.813511, lng: -73.961418)

# user benny, tokyo
user4 = User.create(username: "benny", password: "111", displayname: "Benny", donated_hour: 1, time_slot: "Monday", location: "Online", img: "https://www.pinterest.com/pin/33988172171833984/", bio: "I'm currently living in Tokyo. I also write poems!", lat: 35.689487, lng: 139.691711)

# yuki's skills Mandarin & Photo
user1skill1 = UserSkill.create(skill_id: skill3.id, user_id: user1.id)
user1skill2 = UserSkill.create(skill_id: skill4.id, user_id: user1.id)
# dan's skills Javascript & Drum
user2skill1 = UserSkill.create(skill_id: skill1.id, user_id: user2.id)
user2skill2 = UserSkill.create(skill_id: skill2.id, user_id: user2.id)

# alex's skills Javascript
user3skill1 = UserSkill.create(skill_id: skill1.id, user_id: user3.id)
# benny's skills Javascript
user4skill1 = UserSkill.create(skill_id: skill1.id, user_id: user4.id)


# Exchange time format 2019-11-21 17:15:22
# yuki's mandarin request exchanges dan's drum & js
xchg1 = Exchange.create(time: "2019-11-01 18:00:00", location: "Wework Dumbo", exchanger_id: user1skill1.id, exchangee_id: user2skill2.id, description: "yuki's mandarin requests exchange dan's drum")
xchg2 = Exchange.create(time: "2019-11-01 20:00:00", location: "Wework Dumbo", exchanger_id: user1skill1.id, exchangee_id: user2skill1.id, description: "yuki's mandarin requests exchange dan's javascript")

# dan's drum requests exchanges my photo
xchg3 = Exchange.create(time: "2019-11-02 18:00:00", location: "Wework Dumbo", exchanger_id: user2skill2.id, exchangee_id: user1skill2.id, description: "dan's drum requests exchange yuki's photography")
# userSkill1Exchange = UserSkillExchange.create(user_skill_id: user1skill1, exchange_id: xchg1.id)

# yuki review on the exchange: yuki's mandarin request exchanges dan's drum
review1 = Review.create(user_id: user1.id, exchange_id: xchg1.id, content: "It was great! Dan is a patient teacher!", author: user1.displayname)


puts "Seeded!!"