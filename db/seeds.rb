# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Attach images
# equipment.image.attach io: File.open("spec/assets/test.png"), filename: "test.png", content_type: "image/png"

admin = User.create({
  name: FFaker::Name.name,
  username: FFaker::Internet.user_name,
  email: FFaker::Internet.email,
  password: "test1234",
  role: 'admin'
})

10.times.map do
    User.create({
    name: FFaker::Name.name,
    username: FFaker::Internet.user_name,
    email: FFaker::Internet.email,
    password: "test1234",
    role: 'user'
  })
end

three_d_printer_ender = Equipment.new({
  title: "3D Printer Ender",
  description: "An open-source 3d printer with amazing printing precision and affordable price, quite the best 3d printer for beginners. Allow users to improve their printer upon the source code and share the changes within the community, resulting in an improved experience for all.",
  review: "My co-worker Ali has one of these. He says it looks towering.",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

three_d_printer_ender.image.attach(io: File.open('storage/images/3dprinterender.jpg'), filename: '3dprinterender.jpg', content_type: 'jpg')

three_d_printer_ender.save!


three_d_printer_anet = Equipment.new({
  title: "3D Printer Anet",
  description: "Offering a step-by-step learning experience for a 3D printer kit, the Anet A8 features a black laser-cut acrylic frame and 220 x 220 x 240mm printing volume. It's compatible with a number of materials, including ABS, PLA, Woodfill, Nylon PVA, PP, and others.",
  review: "This Printer works outstandingly well.",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

three_d_printer_anet.image.attach(io: File.open('storage/images/3dprinteranet.jpg'), filename: '3dprinteranet.jpg', content_type: 'jpg')

three_d_printer_anet.save!


airtag = Equipment.new({
  title: "Airtag",
  description: "AirTag is a supereasy way to keep track of your stuff. Attach one to your keys. Put another in your backpack. And just like that, they’re on your radar in the Find My app, where you can also track down your Apple devices and keep up with friends and family.",
  review: "Thanks to UWB technology, AirTag provides precise pinpointing of distance and location. Using iPhones Find My app, you'll see an arrow pointing you in the exact direction of your AirTag. It will also and indicate its distance down to how many feet, and when you're really close, how many inch away it is. This UWB feature requires the finder to be in the same home/office/space as you. If you're not in the same area as the AirTag, it's supported by the largest finder network (nearly a billion iPhones active worldwide), so you can find your lost item within most populated cities in the connected modern world!",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

airtag.image.attach(io: File.open('storage/images/airtag.jpg'), filename: 'airtag.jpg', content_type: 'jpg')

airtag.save!


drone1 = Equipment.new({
  title: "GPS Drone",
  description: "A flying robot that can be remotely controlled or fly autonomously using software-controlled flight plans in its embedded systems, that work in conjunction with onboard sensors and a global positioning system (GPS).",
  review: "TMy husband's birthday wish was to get a drone that had a camera and could hook up to his phone. To his surprise, that's exactly what he got. Not only was he thrilled to get his first drone but was also quite impressed with the quality of the deerc mini drone for such an unbeatable price. Let's be honest, they're quite expensive and hard to find good quality in cheap prices. But to our amazement this little thing is worth the price. It even came with protectors for the propellers plus an extra set of propellers in case anything happens. He read the entire manual which was simple and not made difficult to understand and it's already assembled when you get it. Also has two 10 minute batteries, giving you 20 minutes of fun!! He's only a beginner but he's definitely in love and said once he's ready to upgrade he'll be looking for another deerc's model. It took me some serious comparisons before i picked which one to buy but looks like i chose the perfect one! It says for kids but if you're a beginner adult. This is for you also.!!",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

drone1.image.attach(io: File.open('storage/images/drone1.jpg'), filename: 'drone1.jpg', content_type: 'jpg')

drone1.save!


drone2 = Equipment.new({
  title: "Amazing Drone",
  description: "This Drone have many functions, ranging from monitoring climate change to carrying out search operations after natural disasters, photography, filming, and delivering goods. Intelligent Interactive Drone: The drone is integrated with smart voice control and gesture control. You can speak to control the flying direction, or pose to the camera to trigger photo/video shooting, adding fun to your flight.",
  review: "Thanks RentUrTech! Your drones are amazing and your service is wonderful.",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

drone2.image.attach(io: File.open('storage/images/drone2.jpg'), filename: 'drone2.jpg', content_type: 'jpg')

drone2.save!


drone3 = Equipment.new({
  title: "Quadcore Drone",
  description: "this drone is an extremely well-built ready-to-fly racing drone with all of the features that beginners and pros need. The first thing you’ll notice is the cleaner design. All of the electronics are sandwiched between the carbon fiber on the top and the printed circuit board on the bottom. The only thing that sticks out is the camera which is protected by a hard plastic case.",
  review: "This drone is a pretty easy setup and fun! The app was very nice and user friendly. It is quick and has some nice features, including a very nice camera especially for the price. I really enjoyed the maneuverability of the drone and really liked the flip feature. very cool.",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

drone3.image.attach(io: File.open('storage/images/drone3.jpeg'), filename: 'drone3.jpeg', content_type: 'jpeg')

drone3.save!


home_theater = Equipment.new({
  title: "Home Theater",
  description: "An entertainment system for the home that usually consists of a large television with video components (such as a DVD player and VCR) and an audio system offering surround sound.Low-Profile Design and Brilliant Clarity with 6 Full-range Speakers
  Powerful 5. Wireless Subwoofer and Bluetooth Music Streaming. Complete Immersion with Discreet Volume Adjustable Surround Speakers. Optimized for 4K TVs with Dolby Audio 5.1 and HDMI (Cable Included). Control with TV Remote using HDMI, Audio Cables Included for Easy Setup",
  review: "I'm a big audio fan with too many speakers for one life time. Was trying to go modern with this and this thing blew me away. Mind you I have a small office, but cranked it all the way to feel it and for the price, superb. My samsung harmon kardon can't touch this model. Super impressed",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

home_theater.image.attach(io: File.open('storage/images/home_theater.jpg'), filename: 'home_theater.jpg', content_type: 'jpg')

home_theater.save!


leather_touchscreen_gloves = Equipment.new({
  title: "Touchscreen Gloves",
  description: "Crafted with poise and quality, the gloves present characteristics of masculinity with carefully considered materials. The matte finishing of the leather allows for a well-balanced iconic look in uniform dark tones along with a few areas of contrast intensifying the low-key design.",
  review: "The size, the fitting and the style of the Leather Touchscreen Gloves is amazing!",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

leather_touchscreen_gloves.image.attach(io: File.open('storage/images/leather_touchscreen_gloves.jpeg'), filename: 'leather_touchscreen_gloves.jpeg', content_type: 'jpeg')

leather_touchscreen_gloves.save!


microsoft_oculus = Equipment.new({
  title: "Microsoft Oculus",
  description: "Oculus Rift S Virtual Reality System is available for purchase now. Check out VR gaming, immerse yourself in your favorite movies, or bring friends to play with Oculus Rift S using Windows 10. Keep your experience smooth and seamless, even as high speed action unfolds around you with a super-fast processor and high-resolution display. (Packaging may vary) Meta Quest packaging will continue to carry the Oculus name and logo during the transition to our new branding. Experience total immersion with 3D positional audio, hand tracking and haptic feedback, working together to make virtual worlds feel real.
  Explore an expanding universe of over 250 titles across gaming, fitness, social/multiplayer and entertainment, including exclusive blockbuster releases and totally unique VR experiences",
  review: "This is one of my favorite oculus. I was happy to see how many features it has.",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

microsoft_oculus.image.attach(io: File.open('storage/images/microsoft_oculus.jpeg'), filename: 'microsoft_oculus.jpeg', content_type: 'jpeg')

microsoft_oculus.save!


oculus = Equipment.new({
  title: "Oculus",
  description: "Lightweight, comfortable, and powerful enough to run impressively detailed virtual reality experiences, the Oculus Quest 2 is the best VR headset that Oculus has made so far. And, depending on your perspective on raw power versus portability and comfort, it might just be the best VR headset ever.",
  review: "The best value for money standalone VR headset. Dont go for the negative review that it has bad lense or is cheap bla bla bla, cause you cant even find any VR standalone headset at this price.",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

oculus.image.attach(io: File.open('storage/images/oculus.jpg'), filename: 'oculus.jpg', content_type: 'jpg')

oculus.save!


powerfull_pc = Equipment.new({
  title: "Powerfull Pc",
  description: "✔ AMD Ryzen 5 3600 6-Core 12-Thread 3.6GHz (4.2 GHz Max Boost) CPU | 500GB SSD – Up to 30x faster than traditional HDD
  ✔ GeForce GTX 1660 Super 6GB GDDR6 Graphics Card (Brand May Varies) | 16GB DDR4 3000MHz Gaming Memory with Heat Spreaders | Windows 10 Home 64-bit | AMD High Performance Wraith Cooler
  ✔ 802.11AC Wi-Fi | No Bloatware | Graphics Ports may Vary | HD Audio and Mic | Free Gaming Keyboard and Mouse | 2 x USB 3.0, 2 x USB 2.0, 4 x USB 3.2 Gen1
  ✔ 3 x RGB RING Fans for Maximum Air Flow | Skytech Archangel Gaming Case with Tempered Glass - White",
  review: "Let me just start off by saying that I don't know much about PCs, and I was worried about taking the leap to purchase one, even after doing a couple weeks of research AND asking my hardcore PC gamer friends for advice. However, I am super impressed and so thankful that I chose this one! It is sooo worth the money! I started getting into PC gaming not too long ago, mainly playing Minecraft, and much more recently, Valorant. Both games ran like garbage on my old laptop, so I decided to upgrade - and let me tell you that this PC has not missed a BEAT! The only issues I've ever had with Valorant on this PC were due to internal issues with the game itself, not the PC. No lag AT ALL - same goes for Minecraft and a few smaller games I've played. Everything runs absolutely great! I will say I was a little worried when I opened the box up (I was hoping it hadn't gotten damaged during shipping), but it was actually packaged really nicely and came with a nice quick start guide, which was really useful for me, considering I've never set up a gaming PC before. Everything was hooked up properly internally, so it was plug and play after getting everything arranged the way I wanted on my desk, and I instantly loved the RGB lights! They're awesome! You can change the colors just by pressing a button on the top of the PC. I leave mine on the solid rainbow setting most of the time, but there are so many colors you can rotate through! The other nice thing is that it has a lot of open space inside, so I could definitely upgrade it as needed, and there's 5 cooling fans! It never gets hot (even after HOURS of playing Valorant) and is pretty quiet. The mouse and keyboard included are okay - I'm sure most pro gamers will want to upgrade, but for now, they work good for me. Coupled with my new 24, it's a perfect match for me. If I ever need to purchase another PC in the future, I\'d definitely buy one again",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

powerfull_pc.image.attach(io: File.open('storage/images/powerfullpc.jpg'), filename: 'powerfullpc.jpg', content_type: 'jpg')

powerfull_pc.save!


precision_cooker = Equipment.new({
  title: "Precision Cooker",
  description: "Perfect results every time: Never over or under cook your food again. The Precision Cooker Nano circulates water at the exact temperature required for perfectly cooked meals, no matter what's on your menu.",
  review: "Since I started cooking sous vide my family says my cooking has gone to a new level. I started with the original recision Cooker and just recently picked up the nano. The nano is awesome because it's much smaller vs the first recision Cooker making it easier to store in a drawer or something. It sounds trivial but by making it easier to grab I'm more likely to use it vs the recision Cooker which I kept in a special case in the pantry. I have given up cooking in the rubbermaid container with the silly lid and now just cook in a stockpot with this silicone lid from cellar made. Setup is so much quicker and I can cook a beef roast for 30 hours without adding ANY water. If you're just starting out in sous vide I recommend this cooker. Don't worry about wifi or bluetooth - you don't need it, it's over complicated.",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

precision_cooker.image.attach(io: File.open('storage/images/precision_cooker.jpg'), filename: 'precision_cooker.jpg', content_type: 'jpg')

precision_cooker.save!

turntable = Equipment.new({
  title: "Turntable",
  description: "Whether you’re just getting into records, rediscovering a record collection long since buried away or simply adding a turntable to complete your system, the AT-LP60X fully automatic belt-drive turntable is an excellent choice. This affordable, easy-to-use turntable plays both 33-1/3 and 45 RPM records and, with its built-in switchable phonon preamp, can be connected directly to your home stereo, powered speakers, computer and other components, whether they have a dedicated phonon input or not. An update of the popular AT-LP60, the ATLP60X features a redesigned tone arm base and head shell to improve tracking and reduce resonance. Noise is further reduced by the inclusion of an AC adapter that moves the AC/DC conVersion outside of the chassis where its impact on the signal chain is limited. Audio-Technical has been a leader in phonon cartridge design for more than 50 years, and that expertise shows in the AT-LP60X’s Dual Magnet cartridge with replaceable stylus. The cartridge is integrated into the head shell for assured performance and ease of setup. The turntable comes with a detachable RCA output cable (3. 5 mm male to dual RCA male), 45 RPM adapter, and a removable hinged dust cover. It is available in black (AT-LP60X-BK), brown/black (AT-LP60X-BW), gunmetal/black (AT-LP60X-GM), and red/black (AT-LP60X-RD).",
  review: "This turntable is very affordable and I would highly recommend it for collectors who are new to the hobby and don’t want to spend a lot. So far I haven’t had any issues with it at all and it was a wonderful upgrade to the little suitcase turntable I had started out with.",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

turntable.image.attach(io: File.open('storage/images/turntable.jpeg'), filename: 'turntable.jpeg', content_type: 'jpeg')

turntable.save!


wireless_printer = Equipment.new({
  title: "Wireless Printer",
  description: "The Wireless Printer gives you all the essential features you need—easily print, scan and copy, and activate HP+: HP's smart printing system that comes with 6 months of free Instant Ink and a 2 year extended HP warranty.",
  review: "Set this up when it arrived and have been printing from my computer and phone ever since. So easy for my 75 year old self to set up and use. Quality is great and it didn't cost a fortune.",
  duration: FFaker::Random.rand(60),
  rent_fee: FFaker::Random.rand(1000),
  total_amount_payable: FFaker::Random.rand(100),
  user: User.find_by(role: 'admin')
})

wireless_printer.image.attach(io: File.open('storage/images/wireless_printer.jpeg'), filename: 'wireless_printer.jpeg', content_type: 'jpeg')

wireless_printer.save!