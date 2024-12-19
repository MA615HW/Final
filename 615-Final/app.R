library(shiny)
library(shinydashboard)
library(leaflet)
library(dplyr)

ui <- dashboardPage(
  skin = "blue",
  dashboardHeader(title = "Bahrain Project"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Map of Bahrain", tabName = "map", icon = icon("map")),
      menuItem("Average Expenditure", tabName = "expenditure", icon = icon("dollar-sign")),
      menuItem("Regional Comparison", tabName = "comparison", icon = icon("chart-line")),
      menuItem("SWOT Analysis", tabName = "swot", icon = icon("chart-simple"))
    )
  ),
  dashboardBody(
    tabItems(
      # Home tab
      tabItem(
        tabName = "home",
        h2("Introduction"),
        p("Bahrain, an island nation located in the Arabian Gulf, holds a unique position as a thriving hub for finance, trade, and culture in the Middle East. Despite its small size, Bahrain boasts a rich history dating back millennia, serving as a crossroads of ancient trade routes."),
        p("Today, its strategic location and modern infrastructure make it a vital economic center in the region. Known for its progressive approach to governance and a diversifying economy, Bahrain has emerged as a key player in sectors such as banking, tourism, and technology."),
        img(src = "Flag_of_Bahrain.png", height = "300px", width = "500px", alt = "Flag of Bahrain"),
        
        # Nested tabs
        tabsetPanel(
          tabPanel("Government",
                   p("Bahrain is a constitutional monarchy led by King Hamad bin Isa Al Khalifa, with a government structure that blends traditional monarchy and modern governance. The bicameral legislature includes the Council of Representatives, elected by citizens, and the Shura Council, appointed by the King. This framework supports Bahrain's progressive approach to governance, fostering political stability and enabling the country's active participation in regional initiatives as a member of the Gulf Cooperation Council (GCC).")
          ),
          tabPanel("Economy",
                   p("Bahrain's economy is one of the most diverse in the Gulf region, driven by key sectors such as finance, oil, and tourism. While oil production has historically been a cornerstone of the economy, Bahrain has proactively reduced its dependence on oil by becoming a regional financial hub, with banking and insurance industries contributing significantly to its GDP. The country has also invested in developing its tourism sector, leveraging attractions such as its rich cultural heritage and modern infrastructure.")
          ),
          tabPanel("Population",
                   p("Bahrain is home to a diverse population of over 1.7 million people, comprising both Bahraini nationals and a significant expatriate community. This multicultural society reflects the country's historical role as a trade hub, attracting people from across the Middle East, South Asia, and beyond. Bahrainis enjoy a high literacy rate and access to advanced healthcare and education systems. The local culture is deeply rooted in Arab traditions, yet it is enriched by the presence of expatriates who contribute to the country's workforce, particularly in sectors like construction, finance, and services.")
          ),
          tabPanel("Environment",
                   p("Bahrain's natural environment is characterized by its arid climate, low-lying desert terrain, and surrounding waters of the Arabian Gulf. The nation comprises 33 islands, with Bahrain Island being the largest. Despite its small size and limited freshwater resources, Bahrain is home to diverse marine life and important ecosystems like mangroves and coral reefs. These ecosystems play a vital role in supporting biodiversity and protecting the coastline. However, the natural environment faces challenges such as land reclamation, desertification, and the impacts of climate change, including rising sea levels and extreme heat. Bahrain is actively working to address these issues through environmental conservation initiatives and sustainable urban planning.")
          ),
          tabPanel("History",
                   p("Bahrain has a rich history that dates back thousands of years, making it one of the most ancient trading hubs in the Gulf region. Known in antiquity as Dilmun, it served as a vital center for trade between Mesopotamia and the Indus Valley. Over centuries, Bahrain was ruled by various empires, including the Assyrians, Babylonians, Persians, and later the Portuguese in the 16th century. In 1783, the Al Khalifa family established control, and Bahrain became a British protectorate in the 19th century. The country gained independence in 1971 and has since developed into a modern state while preserving its historical and cultural heritage. Today, Bahrain's legacy as a bridge between ancient civilizations and modern economic progress continues to define its identity.")
          )
        )
      ),
      
      # Map tab
      tabItem(
        tabName = "map",
        h2("Interactive Map of Bahrain"),
        fluidRow(
          column(3,
                 box(
                   width = NULL,
                   title = "Map Controls",
                   checkboxInput("show_restaurants", "Show Restaurants", TRUE),
                   checkboxInput("show_shopping", "Show Shopping", TRUE)
                 )
          ),
          column(9,
                 box(
                   width = NULL,
                   leafletOutput("bahrain_map", height = "800px")
                 )
          )
        )
      ),
      
      # Expenditure tab
      tabItem(
        tabName = "expenditure",
        h2("Average Expenditure Per Visitor Per Trip"),
        tabsetPanel(
          tabPanel("Yearly Comparison",
                   box(
                     width = 12,
                     title = "Average Daily Spend by Visitor Type (Grouped by Year)",
                     img(src = "1.png", width = "100%", height = "auto")
                   )
          ),
          tabPanel("Seasonal Distribution",
                   box(
                     width = 12,
                     title = "Seasonal Distribution of Total Visitor Spending",
                     img(src = "2.png", width = "100%", height = "auto")
                   )
          ),
          tabPanel("Total Visitors Trend",
                   box(
                     width = 12,
                     title = "Average Daily Spend for Total Visitors by Month (2017-2023)",
                     img(src = "3.png", width = "100%", height = "auto")
                   )
          ),
          tabPanel("Overnight Visitors Trend",
                   box(
                     width = 12,
                     title = "Average Daily Spend for Overnight Visitors by Month (2017-2023)",
                     img(src = "4.png", width = "100%", height = "auto")
                   )
          ),
          tabPanel("Same-Day Visitors Trend",
                   box(
                     width = 12,
                     title = "Average Daily Spend for Same-Day Visitors by Month (2017-2023)",
                     img(src = "5.png", width = "100%", height = "auto")
                   )
          ),
          tabPanel("Same-Day Visitors Prediction",
                   box(
                     width = 12,
                     title = "Three-Year Forecast for Average Daily Spend Same-day Visitors (BHD)",
                     img(src = "6.png", width = "100%", height = "auto")
                   )
          ),
          tabPanel("Overnight Visitors Prediction",
                   box(
                     width = 12,
                     title = "Three-Year Forecast for Average Daily Spend Overnight Visitors (BHD)",
                     img(src = "7.png", width = "100%", height = "auto")
                   )
          ),
          tabPanel("Total Visitors Prediction",
                   box(
                     width = 12,
                     title = "Three-Year Forecast for Average Daily Spend Total Visitors (BHD)",
                     img(src = "8.png", width = "100%", height = "auto")
                   )
          )
        )
      ),
      
      # Regional Comparison tab
      tabItem(
        tabName = "comparison",
        h2("Regional Comparison: Bahrain, Qatar, and Saudi Arabia"),
        fluidRow(
          column(12,
                 tabsetPanel(
                   tabPanel("Overview",
                            fluidRow(
                              box(
                                width = 12,
                                title = "Key Economic and Tourism Indicators (2023)",
                                status = "primary",
                                solidHeader = TRUE,
                                tags$table(
                                  class = "table table-striped",
                                  tags$thead(
                                    tags$tr(
                                      tags$th("Indicator"),
                                      tags$th("Bahrain"),
                                      tags$th("Qatar"),
                                      tags$th("Saudi Arabia")
                                    )
                                  ),
                                  tags$tbody(
                                    tags$tr(
                                      tags$td("Population"),
                                      tags$td("1.5 million"),
                                      tags$td("2.9 million"),
                                      tags$td("35.9 million")
                                    ),
                                    tags$tr(
                                      tags$td("Land Area"),
                                      tags$td("767 km²"),
                                      tags$td("11,586 km²"),
                                      tags$td("2,149,690 km²")
                                    ),
                                    tags$tr(
                                      tags$td("GDP Per Capita"),
                                      tags$td("$52,129"),
                                      tags$td("$83,902"),
                                      tags$td("$54,958")
                                    ),
                                    tags$tr(
                                      tags$td("Tourism Contribution to GDP"),
                                      tags$td("6.9%"),
                                      tags$td("7.1%"),
                                      tags$td("3.2%")
                                    ),
                                    tags$tr(
                                      tags$td("International Visitors (2022)"),
                                      tags$td("9.9 million"),
                                      tags$td("2.5 million"),
                                      tags$td("16.1 million")
                                    ),
                                    tags$tr(
                                      tags$td("Hotel Occupancy Rate"),
                                      tags$td("62%"),
                                      tags$td("71%"),
                                      tags$td("64%")
                                    ),
                                    tags$tr(
                                      tags$td("Average Length of Stay"),
                                      tags$td("3.2 days"),
                                      tags$td("3.8 days"),
                                      tags$td("4.5 days")
                                    ),
                                    tags$tr(
                                      tags$td("Number of Hotels"),
                                      tags$td("120+"),
                                      tags$td("180+"),
                                      tags$td("600+")
                                    ),
                                    tags$tr(
                                      tags$td("Airport Passenger Capacity"),
                                      tags$td("14 million"),
                                      tags$td("50 million"),
                                      tags$td("120 million")
                                    )
                                  )
                                )
                              )
                            )
                   ),
                   
                   tabPanel("Tourism Sector",
                            fluidRow(
                              box(
                                width = 12,
                                title = "Tourism Infrastructure",
                                status = "primary",
                                solidHeader = TRUE,
                                h4("Bahrain"),
                                tags$ul(
                                  tags$li("120+ hotels and hotel apartments"),
                                  tags$li("Bahrain International Circuit (F1 venue)"),
                                  tags$li("Bahrain International Airport (recently expanded)"),
                                  tags$li("King Fahd Causeway connecting to Saudi Arabia"),
                                  tags$li("Multiple shopping malls and traditional souqs"),
                                  tags$li("Cultural sites including Qal'at al-Bahrain (UNESCO World Heritage)"),
                                  tags$li("Pearling Path (UNESCO World Heritage)")
                                ),
                                h4("Qatar"),
                                tags$ul(
                                  tags$li("180+ hotels and hotel apartments"),
                                  tags$li("8 World Cup stadiums and facilities"),
                                  tags$li("Hamad International Airport"),
                                  tags$li("National Museum of Qatar"),
                                  tags$li("Museum of Islamic Art"),
                                  tags$li("Katara Cultural Village"),
                                  tags$li("The Pearl-Qatar artificial island"),
                                  tags$li("Souq Waqif traditional market")
                                ),
                                h4("Saudi Arabia"),
                                tags$ul(
                                  tags$li("600+ classified hotels"),
                                  tags$li("Two Holy Mosques"),
                                  tags$li("5 international airports"),
                                  tags$li("Multiple UNESCO World Heritage sites"),
                                  tags$li("Historic Diriyah"),
                                  tags$li("Al-Ula ancient city"),
                                  tags$li("Red Sea Project (under development)"),
                                  tags$li("NEOM (under development)")
                                )
                              )
                            ),
                            fluidRow(
                              box(
                                width = 12,
                                title = "Major Tourism Events and Attractions",
                                status = "info",
                                solidHeader = TRUE,
                                h4("Bahrain"),
                                tags$ul(
                                  tags$li("Formula 1 Gulf Air Bahrain Grand Prix"),
                                  tags$li("Bahrain International Airshow"),
                                  tags$li("Spring of Culture Festival"),
                                  tags$li("Bahrain Food Festival"),
                                  tags$li("Pearl diving experiences"),
                                  tags$li("Traditional dhow building"),
                                  tags$li("Ancient burial mounds"),
                                  tags$li("Bab Al Bahrain traditional market")
                                ),
                                h4("Qatar"),
                                tags$ul(
                                  tags$li("Qatar National Day celebrations"),
                                  tags$li("Qatar International Food Festival"),
                                  tags$li("Shop Qatar Festival"),
                                  tags$li("Doha Cultural Festival"),
                                  tags$li("Desert safari experiences"),
                                  tags$li("The Pearl-Qatar"),
                                  tags$li("Katara Cultural Village"),
                                  tags$li("Education City")
                                ),
                                h4("Saudi Arabia"),
                                tags$ul(
                                  tags$li("Hajj pilgrimage"),
                                  tags$li("Umrah pilgrimage"),
                                  tags$li("Riyadh Season"),
                                  tags$li("Jeddah Season"),
                                  tags$li("Al-Ula Winter Festival"),
                                  tags$li("Red Sea Film Festival"),
                                  tags$li("Saudi Cup (horse racing)"),
                                  tags$li("MDLBeast Music Festival")
                                )
                              )
                            )
                   ),
                   
                   tabPanel("Strategic Development",
                            fluidRow(
                              box(
                                width = 12,
                                title = "Tourism Development Projects",
                                status = "primary",
                                solidHeader = TRUE,
                                h4("Bahrain"),
                                tags$ul(
                                  tags$li("Bahrain Bay Development"),
                                  tags$li("Dilmunia Island"),
                                  tags$li("Galali Waterfront Development"),
                                  tags$li("New Exhibition Centre"),
                                  tags$li("Bahrain Metro Project"),
                                  tags$li("Pearl Bay Development"),
                                  tags$li("Hawar Islands Development")
                                ),
                                h4("Qatar"),
                                tags$ul(
                                  tags$li("Lusail City Development"),
                                  tags$li("West Bay North Beach Project"),
                                  tags$li("Al Wakrah Development"),
                                  tags$li("Msheireb Downtown Doha"),
                                  tags$li("Qetaifan Islands"),
                                  tags$li("Hamad International Airport Expansion"),
                                  tags$li("Qatar Rail Project")
                                ),
                                h4("Saudi Arabia"),
                                tags$ul(
                                  tags$li("NEOM ($500 billion project)"),
                                  tags$li("Red Sea Project"),
                                  tags$li("Qiddiya Entertainment City"),
                                  tags$li("Diriyah Gate Development"),
                                  tags$li("AMAALA Luxury Tourism Project"),
                                  tags$li("AlUla Development"),
                                  tags$li("Ad Diriyah UNESCO site development")
                                )
                              )
                            ),
                            fluidRow(
                              box(
                                width = 12,
                                title = "Strategic Analysis",
                                status = "info",
                                solidHeader = TRUE,
                                p("Each country has developed distinct tourism strategies:"),
                                tags$ul(
                                  tags$li(strong("Bahrain: "), "Focus on cultural tourism, F1 racing, and being a weekend destination"),
                                  tags$li(strong("Qatar: "), "Emphasis on luxury tourism, sports events, and cultural attractions"),
                                  tags$li(strong("Saudi Arabia: "), "Religious tourism combined with ambitious new tourism projects")
                                ),
                                p("The regional tourism market is diverse and complementary rather than purely competitive, with each country leveraging its unique advantages and positioning.")
                              )
                            )
                   )
                 )
          )
        )
      ),
      tabItem(
        tabName = "swot",
        h2("SWOT Analysis of Bahrain's Tourism Sector"),
        tabsetPanel(
          # Strengths Tab
          tabPanel("Strengths",
                   box(
                     width = 12,
                     status = "success",
                     solidHeader = TRUE,
                     title = "Strengths",
                     tags$ul(
                       tags$li(strong("Strategic Location"), 
                               tags$ul(
                                 tags$li("Central position in the Gulf region"),
                                 tags$li("King Fahd Causeway connection to Saudi Arabia"),
                                 tags$li("Well-connected international airport"),
                                 tags$li("Proximity to major Middle Eastern business hubs")
                               )
                       ),
                       tags$li(strong("Liberal Business Environment"), 
                               tags$ul(
                                 tags$li("Progressive regulatory framework"),
                                 tags$li("Established financial center"),
                                 tags$li("Foreign ownership friendly"),
                                 tags$li("Low tax environment")
                               )
                       ),
                       tags$li(strong("Tourism Infrastructure"), 
                               tags$ul(
                                 tags$li("Modern hotels and resorts"),
                                 tags$li("Formula 1 race track"),
                                 tags$li("High-end shopping malls"),
                                 tags$li("Well-preserved historical sites")
                               )
                       ),
                       tags$li(strong("Cultural Heritage"), 
                               tags$ul(
                                 tags$li("UNESCO World Heritage sites"),
                                 tags$li("Traditional pearl diving history"),
                                 tags$li("Rich archaeological sites"),
                                 tags$li("Vibrant local culture and traditions")
                               )
                       )
                     )
                   )
          ),
          
          # Weaknesses Tab
          tabPanel("Weaknesses",
                   box(
                     width = 12,
                     status = "danger",
                     solidHeader = TRUE,
                     title = "Weaknesses",
                     tags$ul(
                       tags$li(strong("Limited Geographic Size"), 
                               tags$ul(
                                 tags$li("Restricted space for expansion"),
                                 tags$li("Limited natural attractions"),
                                 tags$li("Constraints on large-scale developments"),
                                 tags$li("Limited agricultural resources")
                               )
                       ),
                       tags$li(strong("Economic Challenges"), 
                               tags$ul(
                                 tags$li("High dependence on regional tourism"),
                                 tags$li("Limited economic diversification"),
                                 tags$li("Reliance on weekend tourism"),
                                 tags$li("Seasonal fluctuations in visitor numbers")
                               )
                       ),
                       tags$li(strong("Infrastructure Gaps"), 
                               tags$ul(
                                 tags$li("Public transportation limitations"),
                                 tags$li("Traffic congestion issues"),
                                 tags$li("Limited entertainment options"),
                                 tags$li("Need for infrastructure modernization")
                               )
                       ),
                       tags$li(strong("Market Position"), 
                               tags$ul(
                                 tags$li("Strong regional competition"),
                                 tags$li("Limited global brand recognition"),
                                 tags$li("Perception as a weekend destination"),
                                 tags$li("Limited marketing reach")
                               )
                       )
                     )
                   )
          ),
          
          # Opportunities Tab
          tabPanel("Opportunities",
                   box(
                     width = 12,
                     status = "info",
                     solidHeader = TRUE,
                     title = "Opportunities",
                     tags$ul(
                       tags$li(strong("Tourism Development"), 
                               tags$ul(
                                 tags$li("Expansion of cultural tourism"),
                                 tags$li("Development of eco-tourism"),
                                 tags$li("Growth in MICE tourism"),
                                 tags$li("Sports tourism potential")
                               )
                       ),
                       tags$li(strong("Market Expansion"), 
                               tags$ul(
                                 tags$li("Growing regional tourism market"),
                                 tags$li("Emerging Asian markets"),
                                 tags$li("Digital tourism opportunities"),
                                 tags$li("Cruise tourism potential")
                               )
                       ),
                       tags$li(strong("Infrastructure Development"), 
                               tags$ul(
                                 tags$li("New transportation projects"),
                                 tags$li("Waterfront developments"),
                                 tags$li("Smart city initiatives"),
                                 tags$li("Sustainable tourism projects")
                               )
                       ),
                       tags$li(strong("Economic Initiatives"), 
                               tags$ul(
                                 tags$li("Tourism investment incentives"),
                                 tags$li("Public-private partnerships"),
                                 tags$li("International cooperation"),
                                 tags$li("Technology integration")
                               )
                       )
                     )
                   )
          ),
          
          # Threats Tab
          tabPanel("Threats",
                   box(
                     width = 12,
                     status = "warning",
                     solidHeader = TRUE,
                     title = "Threats",
                     tags$ul(
                       tags$li(strong("Regional Competition"), 
                               tags$ul(
                                 tags$li("Emerging destinations in GCC"),
                                 tags$li("Competitive pricing in other markets"),
                                 tags$li("Large-scale projects in neighboring countries"),
                                 tags$li("Similar offerings in the region")
                               )
                       ),
                       tags$li(strong("Economic Factors"), 
                               tags$ul(
                                 tags$li("Global economic uncertainties"),
                                 tags$li("Oil price fluctuations"),
                                 tags$li("Currency exchange risks"),
                                 tags$li("Regional economic challenges")
                               )
                       ),
                       tags$li(strong("Environmental Concerns"), 
                               tags$ul(
                                 tags$li("Climate change impacts"),
                                 tags$li("Environmental degradation"),
                                 tags$li("Limited natural resources"),
                                 tags$li("Sustainability challenges")
                               )
                       ),
                       tags$li(strong("Market Dynamics"), 
                               tags$ul(
                                 tags$li("Changing tourist preferences"),
                                 tags$li("Political regional tensions"),
                                 tags$li("Travel industry disruptions"),
                                 tags$li("Technology adaptation challenges")
                               )
                       )
                     )
                   )
          ),
          
          # Summary Tab
          tabPanel("Summary",
                   box(
                     width = 12,
                     title = "SWOT Analysis Summary",
                     status = "primary",
                     solidHeader = TRUE,
                     p("Bahrain's tourism sector shows significant potential with strong fundamentals in terms of location, infrastructure, and cultural heritage. The key findings from the SWOT analysis indicate:"),
                     tags$ul(
                       tags$li(strong("Key Advantages:"), " Strategic location, liberal environment, and rich cultural heritage provide a strong foundation for tourism growth."),
                       tags$li(strong("Main Challenges:"), " Limited size, regional competition, and infrastructure gaps need strategic attention."),
                       tags$li(strong("Growth Potential:"), " Opportunities in niche markets, infrastructure development, and digital transformation can drive future growth."),
                       tags$li(strong("Risk Factors:"), " Regional competition, economic uncertainties, and environmental concerns require careful management.")
                     ),
                     h4("Strategic Recommendations"),
                     tags$ul(
                       tags$li("Focus on developing unique tourism experiences that leverage Bahrain's cultural heritage"),
                       tags$li("Invest in infrastructure modernization and smart city initiatives"),
                       tags$li("Develop sustainable tourism practices to address environmental concerns"),
                       tags$li("Strengthen digital marketing and online presence to reach new markets"),
                       tags$li("Foster public-private partnerships for tourism development")
                     )
                   )
          )
        )
      )
    )
  )
)

server <- function(input, output, session) {
  # Load data
  shopping_data <- reactive({
    read.csv("shopping.csv", stringsAsFactors = FALSE)
  })
  
  restaurants_data <- reactive({
    read.csv("restaurants.csv", stringsAsFactors = FALSE)
  })
  
  # Function to create custom icons
  createCustomIcon <- function(type) {
    if (type == "restaurant") {
      iconUrl <- "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png"
    } else {
      iconUrl <- "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-blue.png"
    }
    
    makeIcon(
      iconUrl = iconUrl,
      iconWidth = 25,
      iconHeight = 41,
      iconAnchorX = 12,
      iconAnchorY = 41
    )
  }
  
  # Render the map with reactive markers
  output$bahrain_map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 50.5860, lat = 26.2235, zoom = 10) %>%
      addLayersControl(
        overlayGroups = c("Restaurants", "Shopping"),
        options = layersControlOptions(collapsed = FALSE)
      )
  })
  
  # Observe checkbox changes to update the map
  observe({
    leafletProxy("bahrain_map") %>%
      clearMarkers()
    
    if (input$show_restaurants) {
      leafletProxy("bahrain_map") %>%
        addMarkers(
          data = restaurants_data(),
          lng = ~POINT_X_Longitude,
          lat = ~POINT_Y_Latitude,
          icon = createCustomIcon("restaurant"),
          popup = ~paste("<b>", X.NAME, "</b><br>",
                         "Type: ", TYPE.EN, "<br>",
                         "Subtype: ", SUBTYPE.EN, "<br>",
                         "Block: ", BLOCK, "<br>",
                         "Location: ", location),
          group = "Restaurants"
        )
    }
    
    if (input$show_shopping) {
      leafletProxy("bahrain_map") %>%
        addMarkers(
          data = shopping_data(),
          lng = ~X.Longitude,
          lat = ~Y.Latitude,
          icon = createCustomIcon("shopping"),
          popup = ~paste("<b>", Name, "</b><br>",
                         "Type: ", Type, "<br>",
                         "Subtype: ", Subtype, "<br>",
                         "Block: ", Block, "<br>",
                         "Location: ", Location),
          group = "Shopping"
        )
    }
  })
}

shinyApp(ui, server)