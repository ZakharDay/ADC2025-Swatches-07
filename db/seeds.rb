@companies = ["Walmart", "Sinopec Group", "Royal Dutch Shell", "China National Petroleum", "Exxon Mobil", "BP", "State Grid", "Volkswagen", "Toyota Motor", "Glencore", "Total", "Chevron", "Samsung Electronics", "Berkshire Hathaway", "Apple", "McKesson", "Daimler", "Industrial & Commer. Bank of China", "EXOR Group", "AXA", "General Motors", "E.ON", "Phillips 66", "General Electric", "ENI", "Gazprom", "Ford Motor", "Petrobras", "China Construction Bank", "CVS Health", "Hon Hai Precision Industry", "Allianz", "AT&T", "Valero Energy", "UnitedHealth Group", "Agricultural Bank of China", "China State Construction Engineering", "Japan Post Holdings", "PDVSA", "Trafigura Beheer", "Verizon", "BNP Paribas", "Lukoil", "Honda Motor", "Bank of China", "AmerisourceBergen", "Pemex", "Assicurazioni Generali", "Societe Generale", "Fannie Mae", "Rosneft Oil", "Costco", "HP", "Kroger", "China Mobile Communications", "BMW", "SK Holdings", "Credit Agricole", "Nissan Motor", "SAIC Motor", "JP Morgan Chase", "Tesco", "Siemens", "Carrefour", "Nippon Tel. & Tel.", "Express Scripts Holding", "Banco Santander", "Petronas", "Enel", "Nestlé", "China Railway Engineering", "China National Offshore Oil", "GDF Suez", "Prudential plc", "Statoil", "BASF", "Noble Group", "Électricité de France", "China Railway Construction", "Bank of America Corp.", "HSBC Holdings", "IBM", "Marathon Petroleum", "Cardinal Health", "Boeing", "Citigroup", "China Development Bank", "Amazon.com", "Hitachi", "Wells Fargo", "ING Group", "JX Holdings", "PTT", "China Life Insurance", "Microsoft", "Ping An Insurance", "Metro", "Legal & General Group", "Hyundai Motor", "Procter & Gamble", "Home Depot", "Deutsche Telekom", "Munich Re", "Archer Daniels Midland", "Sinochem", "Airbus Group", "China FAW Group", "ArcelorMittal", "Dongfeng Motor Group", "SoftBank Group", "Deutsche Post", "Itaú Unibanco Holding", "China Southern Power Grid", "Walgreens", "China Resources National", "Sony", "Target", "Johnson & Johnson", "Indian Oil", "Anthem", "MetLife", "Zurich Insurance Group", "Aviva", "Alphabet", "Marubeni", "Banco do Brasil", "State Farm Insurance Cos.", "Peugeot", "Groupe Auchan", "Pertamina", "Panasonic", "Mitsubishi Corp.", "Freddie Mac", "Groupe BPCE", "Comcast", "Vodafone Group", "U.S. Postal Service", "Nippon Life Insurance", "BHP Billiton", "Telefonica", "PepsiCo", "Dai-ichi Life Insurance", "China Post Group", "China North Industries", "Lloyds Banking Group", "Tewoo Group", "AEON", "Finatis", "United Technologies", "Bosch", "Louis Dreyfus Commodities", "AIG", "Unilever", "RWE", "America Movil", "Pacific Construction Group", "Toshiba", "Reliance Industries", "Aviation Industry Corp. of China", "China Telecommunications", "Tokyo Electric Power", "POSCO", "Aegon", "Deutsche Bank", "China Communications Construction", "CNP Assurances", "Novartis", "UPS", "Dow Chemical", "Aetna", "Wesfarmers", "Bunge", "Intesa Sanpaolo", "People's Insurance Co. of China", "LG Electronics", "Lowe's", "Sberbank", "Bayer", "ThyssenKrupp", "ConocoPhillips", "Woolworths", "Intel", "Energy Transfer Equity", "Seven & I Holdings", "Banco Bradesco", "CITIC Group", "Caterpillar", "Repsol", "Roche Group", "Bank of Communications", "Renault", "Saint-Gobain", "Korea Electric Power", "Prudential Financial", "Barclays", "Shenhua Group", "Deutsche Bahn", "China Minmetals", "Orange", "Vinci", "Mitsubishi UFJ Financial Group", "JBS", "ACS", "Nippon Steel & Sumitomo Metal", "SSE", "Itochu", "Beijing Automotive Group", "A.P. Møller-Mærsk A/S", "SABIC", "Hyundai Heavy Industries", "Pfizer", "Manulife Financial", "Mitsui", "Walt Disney", "Schlumberger", "Humana", "Centrica", "Baosteel Group", "International Petroleum Investment", "Enterprise Products", "Banco Bilbao Vizcaya Argentaria", "Rio Tinto Group", "OMV Group", "China Huaneng Group", "Cisco Systems", "Anheuser-Busch InBev", "China United Network Communications", "Huawei Investment & Holding", "Sysco", "Ingram Micro", "Lenovo Group", "Coca-Cola", "Continental", "Shandong Weiqiao Pioneering", "China Merchants Bank", "LyondellBasell Industries", "Lockheed Martin", "FedEx", "HeBei Iron & Steel Group", "Aluminum Corp. of China", "Sanofi", "Kia Motors", "Sumitomo Mitsui Financial Group", "Bouygues", "Johnson Controls", "UniCredit Group", "Amer International Group", "Royal Ahold", "Plains GP Holdings", "World Fuel Services", "Fujitsu", "Wilmar International", "Power China", "Tata Motors", "CHS", "MS&AD Insurance", "American Airlines Group", "Greenland Holding Group", "Merck", "State Bank of India", "Christian Dior", "Best Buy", "Meiji Yasuda Life Insurance", "Shanxi Coking Coal Group", "ChemChina", "National Australia Bank", "KDDI", "Volvo", "Commonwealth Bank", "China National Bldg. Materials Group", "Industrial Bank", "COFCO", "Delta Air Lines", "Jiangsu Shagang Group", "Honeywell International", "Sinopharm", "HCA Holdings", "Goldman Sachs Group", "Tesoro", "Bharat Petroleum", "China Minsheng Banking", "Jardine Matheson", "Iberdrola", "ABB", "Lufthansa Group", "Liberty Mutual Insurance Group", "Weston", "Sinomach", "Credit Suisse Group", "Tokio Marine Holdings", "Mitsubishi Electric", "Talanx", "Denso", "United Continental Holdings", "DZ Bank", "Shanghai Pudong Devel. Bank", "New York Life Insurance", "Power Corp. of Canada", "Royal Bank of Canada", "Oracle", "Sainsbury's", "GS Caltex", "Royal Bank of Scotland Group", "Bohai Steel Group", "Alimentation Couche-Tard", "Morgan Stanley", "Idemitsu Kosan", "UBS Group", "GlaxoSmithKline", "Poste Italiane", "Tyson Foods", "Vale", "Swiss Re", "Edeka Zentrale", "Jizhong Energy Group", "CPC", "Suncor Energy", "Magna International", "Mitsubishi Heavy Industries", "Nationwide", "China National Aviation Fuel Group", "SNCF", "Deere", "DuPont", "American Express", "China Metallurgical Group", "Hindustan Petroleum", "China Pacific Insurance", "Hanwha", "Westpac Banking", "Achmea", "Korea Gas", "Allstate", "Canon", "Standard Life", "Hutchison Whampoa", "JFE Holdings", "Cigna", "Zhejiang Materials Industry Group", "Bridgestone", "Datong Coal Mine Group", "CEFC China Energy", "China Guodian", "Xinxing Cathay International", "China Huadian", "Ecopetrol", "Hyundai Mobis", "Mondelez International", "TIAA-CREF", "Sumitomo", "Enbridge", "INTL FCStone", "PKN ORLEN Group", "Jiangxi Copper", "Pegatron", "Massachusetts Mutual Life", "Toronto-Dominion Bank", "Shanxi LuAn Mining Group", "Telecom Italia", "DirecTV", "Mitsubishi Chemical Holdings", "Guangzhou Automobile Industry Group", "Ericsson", "Henan Energy & Chemical", "Air France-KLM Group", "China Electronics", "Schneider Electric", "Australia & New Zeal. Bnkg.", "Halliburton", "Gas Natural Fenosa", "China Shipbuilding Industry", "Sumitomo Life Insurance", "Shandong Energy Group", "Accenture", "Twenty-First Century Fox", "Veolia Environnement", "3M", "CFE", "Shanxi Jincheng Anthracite Coal Mining", "Shaanxi Yanchang Petroleum", "Koç Holding", "Jinneng Group", "Sears Holdings", "Kansai Electric Power", "Royal Philips", "General Dynamics", "Fresenius", "Publix Super Markets", "Quanta Computer", "China Nonferrous Metal Mining", "China Energy Engineering", "China Datang", "Formosa Petrochemical", "Rabobank", "L'Oreal", "Sompo Japan Nipponkoa", "Migros Group", "Philip Morris International", "Mapfre Group", "Kailuan Group", "Coop Group", "Shougang Group", "China Power Investment", "VTB Bank", "Phoenix Pharmahandel", "Unipol", "Delhaize Group", "La Poste", "Yangquan Coal Industry Group", "TJX", "BT Group", "Mizuho Financial Group", "Vivendi", "Ultrapar Holdings", "Time Warner", "Shaanxi Coal & Chemical Industry", "Bank of Nova Scotia", "Compass Group", "Chubu Electric Power", "China Everbright Group", "Macy's", "Danone", "Compal Electronics", "Energie Baden-Württemberg", "Nike", "China General Technology", "Tech Data", "TonenGeneral Sekiyu", "Mazda Motor", "Avnet", "Morrisons", "China Ocean Shipping", "Northwestern Mutual", "McDonald's", "Exelon", "Suzuki Motor", "China Aerospace Science & Technology", "Travelers", "S-Oil", "Anglo American", "Samsung C&T", "Aisin Seiki", "International Airlines Group", "NEC", "Lotte Shopping", "Adecco Group", "Rite Aid", "Qualcomm", "Oil & Natural Gas", "International Paper", "Ansteel Group", "Fuji Heavy Industries", "Flextronics International", "Medipal Holdings", "AstraZeneca", "Samsung Life Insurance", "China Poly Group", "Michelin", "Occidental Petroleum", "GasTerra", "Sumitomo Electric Industries", "Duke Energy", "Heineken Holding", "HNA Group", "Daiwa House Industry", "Old Mutual", "AIA Group", "BAE Systems", "TUI", "Sharp", "Cathay Life Insurance", "Taiwan Semiconductor", "LG Display", "Greenergy Fuels Holdings", "CRH", "East Japan Railway", "Zhejiang Geely Holding Group", "Gilead Sciences", "Standard Chartered", "Perusahaan Listrik Negara", "Telstra", "Alstom", "Baker Hughes", "Emerson Electric", "Sodexo", "National Grid", "EMC", "ZF Friedrichshafen", "Landesbank Baden-Württemberg", "Onex", "Vattenfall", "United Services Auto. Assn.", "Union Pacific", "Northrop Grumman", "Alcoa", "Capital One Financial", "AntarChile", "Rolls-Royce Holdings", "Cosmo Oil", "Wuhan Iron & Steel", "Ikea", "Tesla"]
@hex_symbols = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']

def seed
  reset_db

  create_colors

  create_admin_user
  create_users(10)

  create_projects(30)
  create_swatches(100..200)
  create_fills(200..300)

  add_swatches_to_projects
  add_fills_to_swatches
  add_colors_to_fills
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def get_random_color
  color_hex = []

  6.times do
    color_hex << @hex_symbols.sample
  end

  color_hex.join('')
end

def create_colors
  # (0..255).each do |r|
  #   (0..255).each do |g|
  #     (0..255).each do |b|
  (100..105).each do |r|
    (100..105).each do |g|
      (100..105).each do |b|
        # Format each component as a two-digit hexadecimal string
        hex_r = '%02x' % r
        hex_g = '%02x' % g
        hex_b = '%02x' % b

        # Combine them into a full hex color string
        rgb_hash = "#{hex_r}#{hex_g}#{hex_b}"

        color = Color.create!(rgb_hash: rgb_hash)
        puts "Color ##{color.rgb_hash} just created"
      end
    end
  end
end

def create_users(quantity)
  i = 0

  quantity.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest'
    }

    user = User.create!(user_data)
    puts "User created with id #{user.id}"

    i += 1
  end
end

def create_admin_user
  user_data = {
    email: "admin@email.com",
    password: 'testtest',
    admin: true
  }

  user = User.create!(user_data)
  puts "User created with id #{user.id}"
end

def create_projects(quantity)
  quantity.times do
    user = User.all.sample
    project = user.projects.create!(name: @companies.sample)
    puts "Project with name #{project.name} just created"
  end
end

def create_swatches(quantity)
  # Project.all.each do |project|
  #   i = 1
  #   user = project.user

  #   quantity.to_a.sample.times do
  #     swatch = project.swatches.create!(name: "Swatch #{i}", user: user)
  #     i += 1
  #     puts "Swatch with name #{swatch.name} for project with name #{swatch.project.name} just created"
  #   end
  # end

  i = 1

  quantity.to_a.sample.times do
    user = User.all.sample
    swatch = Swatch.create!(name: "Swatch #{i}", user: user)
    i += 1
    puts "Swatch with name #{swatch.name} just created"
  end
end

def create_fills(quantity)
  quantity.to_a.sample.times do
    user = User.all.sample
    fill = user.fills.create!(name: "Color")
    puts "Fill with var name #{fill.name} just created"
  end
end

def add_swatches_to_projects
  swatches = Swatch.all

  swatches.each do |swatch|
    choice = (1..10).to_a.sample

    if choice != 1
      swatch.project_id = Project.all.sample.id
      swatch.save!
      puts "Swatch with id #{swatch.id} just added to project with id #{swatch.project.id}"
    end
  end
end

def add_fills_to_swatches
  fills = Fill.all

  fills.each do |fill|
    choice = (1..10).to_a.sample

    if choice != 1
      # Это делается не так, у нас другая связь!!!
      # fill.swatch_id = Swatch.all.sample.id

      swatch = Swatch.all.sample
      swatch.fills << fill

      # fill.save!
      puts "Fill with id #{fill.id} just added to swatch with id #{fill.swatches.first.id}"
    end
  end
end

def add_colors_to_fills
  Fill.all.each do |fill|
    type = ['solid', 'gradient'].sample

    if type == 'solid'
      create_fill_color(fill)
    elsif type == 'gradient'
      create_gradient_color(fill)
    end
  end
end

def create_fill_color(fill)
  # Мы используем другой тип связи
  # color = fill.colors.create!(color: Color.all.sample)

  color = Color.all.sample
  fill.colors << color

  puts "Color ##{color.rgb_hash} just added to fill with id #{fill.id}"
  
  color
end

def create_gradient_color(fill)
  quantity = (2..5).to_a.sample
  first_stop = (0..40).to_a.sample
  last_stop = (60..100).to_a.sample

  if quantity > 2
    range = last_stop - first_stop
    step = range / (quantity - 1)
  end

  i = 1

  quantity.times do
    stop = 0

    if i == 1
      stop = first_stop
    elsif i == quantity
      stop = last_stop
    else
      stop = first_stop + (step * (i - 1))
    end

    # У нас больше нет stop у color
    # color = fill.colors.create!(stop: stop, color: Color.all.sample)
    
    color = Color.all.sample
    fill_color = FillColor.create!(fill_id: fill.id, color_id: color.id, stop: stop)

    puts "Color ##{color.rgb_hash} just added to fill with id #{fill.id}"

    i += 1
  end
end

seed
