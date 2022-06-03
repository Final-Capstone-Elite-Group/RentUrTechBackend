# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  three_d_printer_ender = Equipment.create(
    title { "3D Printer Ender" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) })

  three_d_printer_ender.images.attach(io: File.open('/storage/images'), filename: '3dprinterender.jpeg', content_type: 'jpeg')


  three_d_printer_anet = Equipment.create(
    title { "3D Printer Anet" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  three_d_printer_anet.images.attach(io: File.open('/storage/images'), filename: '3dprinteranet.jpeg', content_type: 'jpeg')


  airtag = Equipment.create(
    title { "Airtag" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  airtag.images.attach(io: File.open('/storage/images'), filename: 'airtag.jpeg', content_type: 'jpeg')


  drone1 = Equipment.create(
    title { "Drone" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  drone1.images.attach(io: File.open('/storage/images'), filename: 'drone1.jpeg', content_type: 'jpeg')


  drone2 = Equipment.create(
    title { "Drone" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  drone2.images.attach(io: File.open('/storage/images'), filename: 'drone2.jpeg', content_type: 'jpeg')


  drone3 = Equipment.create(
    title {"Drone" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  drone3.images.attach(io: File.open('/storage/images'), filename: 'drone3.jpeg', content_type: 'jpeg')


  home_theater = Equipment.create(
    title {"Home Theater" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  home_theater.images.attach(io: File.open('/storage/images'), filename: 'home_theater.jpeg', content_type: 'jpeg')

  leather_touchscreen_gloves = Equipment.create(
    title { "Leather Touchscreen Gloves" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  leather_touchscreen_gloves.images.attach(io: File.open('/storage/images'), filename: 'leather_touchscreen_gloves.jpeg', content_type: 'jpeg')


  microsoft_oculus = Equipment.create(
    title { "Microsoft Oculus" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  microsoft_oculus.images.attach(io: File.open('/storage/images'), filename: 'microsoft_oculus.jpeg', content_type: 'jpeg')


  oculus = Equipment.create(
    title { "Oculus" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  oculus.images.attach(io: File.open('/storage/images'), filename: 'oculus.jpeg', content_type: 'jpeg')

  powerfull_pc = Equipment.create(
    title { "Powerfull Pc" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  powerfull_pc.images.attach(io: File.open('/storage/images'), filename: 'powerfullpc.jpeg', content_type: 'jpeg')

  precision_cooker = Equipment.create(
    title { "Precision Cooker" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  precision_cooker.images.attach(io: File.open('/storage/images'), filename: 'precision_cooker.jpeg', content_type: 'jpeg')

  turntable = Equipment.create(
    title { "Turntable" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  turntable.images.attach(io: File.open('/storage/images'), filename: 'turntable.jpeg', content_type: 'jpeg')

  wireless_printer = Equipment.create(
    title { "Wireless Printer" }
    description { FFaker::Book.description }
    review { FFaker::Lorem.word }
    date_reserved { Date.today }
    duration { FFaker::Random.rand(60) }
    rent_fee { FFaker::Random.rand(1000) }
    total_amount_payable { FFaker::Random.rand(1000) }

  wireless_printer.images.attach(io: File.open('/storage/images'), filename: 'wireless_printer.jpeg', content_type: 'jpeg')
