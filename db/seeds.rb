
Exchange.destroy_all 
UserSkillExchange.destroy_all
UserSkill.destroy_all
Skill.destroy_all
User.destroy_all

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

user1 = User.create(username: "yukiyao", password: "123123", displayname: "yuki", donated_hour: 2, time_slot: "weekend", location: "Prospect park", img: "www.google.com", bio: 'first bio')

user2 = User.create(username: "dangrammer", password: "456456", displayname: "dan", donated_hour: 2, time_slot: "Thursday", location: "Williamsburg", img: "www.google.com", bio: 'second bio')

# yuki's skills Mandarin & Photo
user1skill1 = UserSkill.create(skill_id: skill3.id, user_id: user1.id)
user1skill2 = UserSkill.create(skill_id: skill4.id, user_id: user1.id)
# dan's skills Javascript & Drum
user2skill1 = UserSkill.create(skill_id: skill1.id, user_id: user2.id)
user2skill2 = UserSkill.create(skill_id: skill2.id, user_id: user2.id)

# Exchange time format 2019-11-21 17:15:22
# yuki's mandarin request exchanges dan's drum & js
xchg1 = Exchange.create(time: "2019-12-01 18:00:00", location: "Wework Dumbo", exchanger_id: user1skill1.id, exchangee_id: user2skill2.id, description: "yuki's mandarin requests exchange dan's drum")
xchg2 = Exchange.create(time: "2019-12-02 18:00:00", location: "Wework Dumbo", exchanger_id: user1skill1.id, exchangee_id: user2skill1.id, description: "yuki's mandarin requests exchange dan's javascript")

# dan's drum requests exchanges my photo
xchg3 = Exchange.create(time: "2019-12-01 18:00:00", location: "Wework Dumbo", exchanger_id: user2skill2.id, exchangee_id: user1skill2.id, description: "dan's drum requests exchange yuki's photography")
# userSkill1Exchange = UserSkillExchange.create(user_skill_id: user1skill1, exchange_id: xchg1.id)

puts "Seeded!!"