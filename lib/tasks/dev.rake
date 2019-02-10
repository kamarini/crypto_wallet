namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
  	if Rails.env.development?
  		show_spinner('Apagando BD...') { %x(rails db:drop)}
  		show_spinner('Criando BD...') { %x(rails db:create)}
  		show_spinner('Migrando BD...') { %x(rails db:migrate)}
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
      

  	else
  		puts'Você está em ambiente de desenvolvimento!'
  	end		
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [ #array
                {    #hash
                  description: "Bitcoin",
                  acronym: "BTC", 
                  url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ4apd7vqQXkZGHuJf4w7udvVELUGN-f5cPraxF9TT_omi0pcA",
                  mining_type: MiningType.find_by(acronym: 'PoW')
                },
                {
                  description: "Ethereum",
                  acronym: "ETH", 
                  url_image: "data:image/png;base64,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",
                  mining_type: MiningType.all.sample
                },
                {
                  description: "Dash",
                  acronym: "DSH", 
                  url_image: "data:image/png;base64,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",
                  mining_type: MiningType.all.sample
                }   
              ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end 

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
          {description: "Proof od Work", acronym: "PoW"},
          {description: "Proof od Stake", acronym: "PoS"},
          {description: "Proof od Capacity", acronym: "PoC"}
      ]

      mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
      end
    end  
  end   


  private

  def show_spinner(msg_start, msg_end = 'Concluído!')
  	spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
  	spinner.auto_spin
  	yield
  	spinner.success("(#{msg_end})")
  end
end
