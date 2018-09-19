# Nūish Backend Rails

This application allows dietitians to easily access formulary diets. In a day-to-day work life all dietitians that work with patients that recieve their nutrition via tube feeding, whether they are in the hospital or working in long-term care, look up different tube feeding formulas through a multiple booklets, or pamphlets depending on the brand. Below this is an example of one of the many booklets that the dietitian reviews (notice that you are not able to easily find information when you select command + F). This application allows dietitians to easily filter through formula by formula type (specialty or standard), allergy specifications, and MCT oil percentages, as well as a global search for any other specifications.

Nestle formulas: https://www.nestlehealthscience.ca/en/resources/documents/2018%20nhs%20product%20guide_august%20updates.pdf


https://github.com/shebesabrina/Nurish-BE/issues/2

## See It Live
[Nurish](https://nurish-app-fe.herokuapp.com/) on Heroku

## Back End Technologies
* Ruby v. 2.4.1  
* Rails v. 5.2.1

## Primary JavaScript Technologies Used
* React
* React Router
* Redux

## Additional Libraries/FrameWorks
* Semantic UI
* Jest/Enzyme
* RSpec
* Factory Bot
* PostgresSQL


## Initial Setup

1. Clone this repository and rename the repository to `nurish_be` in one command

  ```shell
  https://your-github-username.github.io/nurish/index.html
  ```
2. Change directory into the `nurish_be` directory

3. Install the dependencies

  ```shell
  bundle
  ```

3. Set up the database

  ```shell
  rake db:create
  rake db:migrate
  rake db:seed
  ```

4. Run test suite

  ```shell
    rspec
  ```

## Running the Server Locally

To see your code in action locally, you need to fire up a development server. Use the command:

```shell
rails s
```

## Endpoints

1. Index page allows you to see all tube feeding formulas:
   - GET "localhost:3000/api/v1/formulas"
   - https://nurish-app.herokuapp.com/api/v1/formulas

```
[
    {
        "id": 1,
        "title": "Beneprotein",
        "description": "Beneprotein instant protein powder is a modular whey protein source. Each 7 g serving provides 6 g of protein. It can be added to most foods, liquids and as a protein flush with tube feedings",
        "usage": "Increased protein requirements",
        "ingredients": "WHEY PROTEIN ISOLATE (MILK), SOY LECITHIN",
        "hcpc": "B4155",
        "restrictions": "CONTAINS MILK AND SOY",
        "image": "Beneprotein.png"
    },
    {
        "id": 2,
        "title": "BOOST Original",
        "description": "BOOST Original is a great tasting, nutritionally complete, meal replacement that can be used as a snack or as a meal. No artificial flavours or colours. Natural source sweetener. For oral use. ",
        "usage": "Poor appetite, Involuntary weight loss, malnutrition, Reduced intake when recovering from illness or surgery, Reduced intake during and after cancer treatment, Reduced intake after oral surgery",
        "ingredients": "WATER, CORN SYRUP, MILK PROTEIN, SUGAR, VEGETABLE OILS (CANOLA, HIGH OLEIC SUNFLOWER AND CORN), SOY PROTEIN, SALT, VITAMINS (VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHA-TOCOPHERYL ACETATE, SODIUM ASCORBATE, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CHOLINE BITARTRATE), MINERALS (SODIUM CITRATE, POTASSIUM CITRATE, POTASSIUM HYDRATE, POTASSIUM CHLORIDE, CALCIUM CARBONATE, TRICALCIUM PHOSPHATE, MAGNESIUM PHOSPHATE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE, SODIUM SELENITE, SODIUM MOLYBDATE, CHROMIUM TRICHLORIDE), CELLULOSE GEL AND GUM, SOY LECITHIN, FLAVOUR, CARRAGEENAN, STEVIA EXTRACT, DIMETHYLPOLYSILOXANE.",
        "hcpc": "B4150",
        "restrictions": null,
        "image": "Boost-Original.png"
    }
]
```
2. Show page allows you to view just one formula with the nutritional overview and nutritional content details:
    - GET "localhost:3000/api/v1/formulas/1"
    - https://nurish-app.herokuapp.com/api/v1/formulas/1
```
{
    "id": 1,
    "title": "Beneprotein",
    "description": "Beneprotein instant protein powder is a modular whey protein source. Each 7 g serving provides 6 g of protein. It can be added to most foods, liquids and as a protein flush with tube feedings",
    "usage": "Increased protein requirements",
    "ingredients": "WHEY PROTEIN ISOLATE (MILK), SOY LECITHIN",
    "hcpc": "B4155",
    "restrictions": "CONTAINS MILK AND SOY",
    "image": "Beneprotein.png",
    "formula_overview": {
        "id": 1,
        "caloric_density": "25 Cal/7 g",
        "protein": "100%",
        "carbohydrate": "0%",
        "fat": "0%",
        "protein_source": "whey protein isolate (milk)",
        "carbohydrate_source": null,
        "fat_source": null,
        "sucralose": null,
        "dietary_fibre": null,
        "fibre_source": null,
        "n6n3_ratio": null,
        "mct_lct": null,
        "omega_3_fatty_acids": null,
        "water_content": null,
        "osmolality": null,
        "kosher": "Y",
        "gluten_free": "Y",
        "lactose_free": null,
        "lactose": "<0.5g/7g serving (not for patients with galactosemia",
        "low_residue": "Y",
        "formula_id": 1
    },
    "nutritional_content": {
        "id": 1,
        "formula_id": 1,
        "properties": {
            "Calories": {
                "7 g*": 25,
                "% Daily Value": ""
            },
            "Fat": {
                "7 g*": "0 g",
                "% Daily Value": "0%"
            },
            "Sodium": {
                "7 g*": "15 mg",
                "% Daily Value": "1%"
            },
            "Potassium": {
                "7 g*": "35 mg",
                "% Daily Value": "2%"
            },
            "Carbohydrate": {
                "7 g*": "0 g",
                "% Daily Value": "0%"
            },
            "Protein": {
                "7 g*": "6 g",
                "% Daily Value": ""
            },
            "Calcium": {
                "7 g*": "",
                "% Daily Value": "2%"
            },
            "Limitations": "Not a significant source of saturated fat, trans fat, cholesterol, fibre, sugars, vitamin A, vitamin C, or iron.",
            "Serving size": "* 1 scoop or packet"
        }
    }
}
```
3. The filter allows dietitians to filter through formulary options:
    - GET "localhost:3000/api/v1/formulas?type=diabetes"
    - https://nurish-app.herokuapp.com/api/v1/formulas?type=diabetes
```
[
    {
        "id": 4,
        "title": "BOOST DIABETIC",
        "description": "BOOST Diabetic is a great tasting, nutritionally complete formula designed to meet the needs of people with diabetes. A unique and calorically balanced blend of protein, fat and carbohydrates. Provides 17 g of carbohydrate per serving. For oral use.",
        "usage": "Diabetes, Hyperglycemia, Glucose intolerance",
        "ingredients": "WATER, MODIFIED MILK INGREDIENTS, TAPIOCA DEXTRIN, VEGETABLE OILS (CANOLA, HIGH OLEIC SUNFLOWER, CORN), SOY PROTEIN ISOLATE, ACACIA GUM, OLIGOFRUCTOSE, INULIN, VITAMINS (VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHA-TOCOPHERYL ACETATE, SODIUM ASCORBATE, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CYANOCOBALAMIN), MINERALS (SODIUM CITRATE, POTASSIUM CITRATE, POTASSIUM HYDRATE, POTASSIUM CHLORIDE, CALCIUM PHOSPHATE, MAGNESIUM PHOSPHATE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE), CELLULOSE GEL AND GUM, SOY LECITHIN, SUCRALOSE, ARTIFICIAL FLAVOUR, CARRAGEENAN, DIMETHYLPOLYSILOXANE.",
        "hcpc": "B4154",
        "restrictions": "CONTAINS MILK AND SOY",
        "image": "Boost-Diabetic.png"
    },
    {
        "id": 34,
        "title": "RESOURCE DIABETIC",
        "description": "Resource Diabetic is a high protein formula with 24% of calories from protein for people with diabetes. For oral and tube feeding use.",
        "usage": "Diabetes, Impaired glucose tolerance, Stress-induced hyperglycemia, Modified carbohydrate requirements, Increased protein requirements",
        "ingredients": "WATER, CORN SYRUP, SODIUM CASEINATE (FROM MILK), HIGH OLEIC SUNFLOWER OIL, FRUCTOSE, GROUND SOY COTYLEDON FIBRE, SOYBEAN OIL, CALCIUM CASEINATE, SOY PROTEIN ISOLATE, ARTIFICIAL FLAVOUR, TRICALCIUM PHOSPHATE, POTASSIUM CITRATE, MONOGLYCERIDES, MAGNESIUM CHLORIDE, POTASSIUM CHLORIDE, POTASSIUM HYDROXIDE, SODIUM PHOSPHATE, CHOLINE CHLORIDE, SODIUM ASCORBATE (VITAMIN C), L-CARNITINE, SODIUM CITRATE, INOSITOL, TAURINE, FERROUS SULPHATE (IRON), ZINC SULPHATE, NIACINAMIDE, ALPHA TOCOPHERYL ACETATE (VITAMIN E), CALCIUM PANTOTHENATE (PANTOTHENIC ACID), MANGANESE SULPHATE, PYRIDOXINE HYDROCHLORIDE, FOLIC ACID, COPPER SULPHATE, RIBOFLAVIN, THIAMINE MONONITRATE, BETA CAROTENE, VITAMIN A PALMITATE, SODIUM MOLYBDATE (MOLYBDENUM), BIOTIN, CHROMIUM CHLORIDE, POTASSIUM IODIDE (IODINE), SODIUM SELENATE (SELENIUM), VITAMIN K1, VITAMIN D3, CYANOCOBALAMIN, DIMETHYLPOLYSILOXANE.",
        "hcpc": "B4150",
        "restrictions": null,
        "image": "Resource-Diabetic.png"
    }
]
```

4. Another filter is by allergens if a patient has an allergy the filter will review all ingredients and restrictions for any key words and only return formulas NOT containing the ingredient:
    - GET "localhost:3000/api/v1/formulas?allergens=soy"
    - https://nurish-app.herokuapp.com/api/v1/formulas?allergens=soy
```
[
    {
        "id": 10,
        "title": "BOOST PUDDING",
        "description": "BOOST Pudding is great tasting and nutritionally complete in a pudding format. It can be used as a snack or dessert. For oral use.",
        "usage": "Involuntary weight loss, Malnutrition, Fluid or volume restrictions, Poor appetite, Chewing or swallowing difficulties",
        "ingredients": "WATER, CORN MALTODEXTRIN, SUGAR, MODIFIED MILK INGREDIENTS, VEGETABLE OILS (CANOLA, HIGH OLEIC SUNFLOWER, CORN), MODIFIED CORN STARCH, SALT, VITAMINS (BETA-CAROTENE, VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHATOCOPHERYL ACETATE, VITAMIN K1, SODIUM ASCORBATE, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CYANOCOBALAMIN, CHOLINE CHLORIDE), MINERALS (SODIUM PHOSPHATE, POTASSIUM CITRATE, POTASSIUM CHLORIDE, CALCIUM PHOSPHATE, MAGNESIUM PHOSPHATE, FERRIC PYROPHOSPHATE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE, SODIUM SELENITE, SODIUM MOLYBDATE, CHROMIUM CHLORIDE), SODIUM STEAROYL-2-LACTYLATE, NATURAL AND ARTIFICIAL FLAVOUR, CARRAGEENAN, STEVIA EXTRACT.",
        "hcpc": "B4150",
        "restrictions": "CONTAINS MILK.",
        "image": "Boost-Pudding.png"
    },
    {
        "id": 16,
        "title": "COMPLEAT",
        "description": "Compleat is the tube feeding formula with real food ingredients including chicken, carrots, peas, tomato, green beans, peaches and cranberry juice. This formula contains a blend of fibre and protein sources, and does not contain corn or soy. For tube feeding use.",
        "usage": "Short or long term whole-protein tube feeding needs, Convenient alternative to homemade tube feeding, Nutrient-rich base for home blenderized tube feeding, Bowel function",
        "ingredients": "WATER, BROWN RICE SYRUP, MILK PROTEIN, CANOLA OIL, DRIED CHICKEN MEAT, TOMATO PASTE, PEACH PURÉE CONCENTRATE, PEA PROTEIN ISOLATE, DRIED GREEN BEANS, PEA FIBRE, DRIED GREEN PEAS, DRIED CARROTS, ACACIA GUM, CRANBERRY JUICE CONCENTRATE, OLIGOFRUCTOSE, SALT, INULIN, ROSEMARY EXTRACT, L-CARNITINE, TAURINE, VITAMINS (BETA-CAROTENE, VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHA TOCOPHERYL ACETATE, VITAMIN K1, SODIUM ASCORBATE, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CYANOCOBALAMIN, CHOLINE CHLORIDE), MINERALS (SODIUM CITRATE, POTASSIUM CITRATE, POTASSIUM CHLORIDE, POTASSIUM HYDRATE, TRICALCIUM PHOSPHATE, TRIMAGNESIUM PHOSPHATE, MAGNESIUM OXIDE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE, SODIUM SELENATE, SODIUM MOLYBDATE, CHROMIUM TRICHLORIDE), SILICON DIOXIDE, CITRIC ACID, DIMETHYLPOLYSILOXANE.",
        "hcpc": "B4149",
        "restrictions": "CONTAINS MILK.",
        "image": "compleat-product-adult.png"
    },
    {
        "id": 18,
        "title": "ISOSOURCE 1.0 HP",
        "description": "Isosource® 1.0 HP is a 1.0 Cal/ml, high protein formula with 25% of calories from protein. This formula does not contain fibre or soy ingredients. For oral and tube feeding use.",
        "usage": "Standard, whole-protein tube feeding needs, Increased protein requirements, Recovery from illness, surgery, and burns, Pressure ulcers, Fibre restriction/contraindication",
        "ingredients": "WATER, CORN SYRUP, MODIFIED MILK INGREDIENTS, CORN MALTODEXTRIN, CANOLA OIL, MEDIUM CHAIN TRIGLYCERIDES (FROM COCONUT AND/OR PALM KERNEL OIL), SALT, TAURINE, L-CARNITINE, VITAMINS (BETA-CAROTENE, VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHA-TOCOPHERYL ACETATE, VITAMIN K1, SODIUM ASCORBATE, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CYANOCOBALAMIN, CHOLINE CHLORIDE), MINERALS (POTASSIUM CITRATE, POTASSIUM CHLORIDE, CALCIUM CITRATE, TRICALCIUM PHOSPHATE, TRIMAGNESIUM PHOSPHATE, MAGNESIUM OXIDE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE, SODIUM SELENITE, SODIUM MOLYBDATE, CHROMIUM TRICHLORIDE), CARRAGEENAN, DIMETHYLPOLYSILOXANE.",
        "hcpc": "B4150",
        "restrictions": "CONTAINS MILK",
        "image": "isosource1-0HP.png"
    },
    {
        "id": 35,
        "title": "RESOURCE THICKENUP",
        "description": "Resource ThickenUp is a starch-based powdered thickener. Can be added to most hot and cold liquids and food.",
        "usage": "Dysphagia",
        "ingredients": "MODIFIED FOOD STARCH (CORN)",
        "hcpc": "B4100",
        "restrictions": "This product is only suitable for individuals greater than 3 years old.",
        "image": "ThickenUp.png"
    },
    {
        "id": 36,
        "title": "RESOURCE THICKENUP CLEAR",
        "description": "Resource ThickenUp Clear is a xanthan-based powdered thickener that remains clear, lump-free, tasteless, odourless, and maintains consistency over time after mixing. Resource ThickenUp Clear is clinically demonstrated to improve swallowing safety. Can be added to most hot and cold liquids.",
        "usage": "Dysphagia",
        "ingredients": "CORN AND POTATO MALTODEXTRIN, XANTHAN GUM, POTASSIUM CHLORIDE.",
        "hcpc": "B4100",
        "restrictions": "This product is only suitable for individuals greater than 3 years old.",
        "image": "Resource-ThickenUp-clear.png"
    },
    {
        "id": 38,
        "title": "TOLOREX",
        "description": "Tolerex is a powdered, nutritonally complete, elemental formula with 100% free amino acids providing 1.0 Cal/ml, with 8.2% protein equivalent and 1.7% calories from fat for the severely compromised GI tract. For oral and tube feeding use.",
        "usage": "Severely impaired GI function: Severe protein and fat malabsorption, TPN alternative, Transition from TPN, Dual feeding with TPN",
        "ingredients": "MALTODEXTRIN (FROM CORN) AND LESS THAN 2% OF MAGNESIUM GLUCONATE, L-GLUTAMINE, CALCIUM GLYCEROPHOSPHATE, MODIFIED CORNSTARCH, L-ARGININE ACETATE, L-ASPARTIC ACID, SAFFLOWER OIL, GLYCINE, L-LYSINE ACETATE, L-LEUCINE, L-PROLINE, POTASSIUM CHLORIDE, L-PHENYLALANINE, L-VALINE, POTASSIUM SORBATE (TO PRESERVE FRESHNESS), L-ALANINE, L-METHIONINE, L-ISOLEUCINE, L-THREONINE, POTASSIUM CITRATE, SODIUM PHOSPHATE, L-SERINE, L-HISTIDINE HYDROCHLORIDE, SODIUM CITRATE, L-TRYPTOPHAN, L-TYROSINE, ASCORBIC ACID (VITAMIN C), CHOLINE BITARTRATE, DL-ALPHA-TOCOPHERYL ACETATE (VITAMIN E), POLYSORBATE 80, FERROUS SULFATE (IRON), ZINC SULFATE, VITAMIN A PALMITATE, NIACINAMIDE, COPPER GLUCONATE, CALCIUM PANTOTHENATE (PANTOTHENIC ACID), VITAMIN D3 (CHOLECALCIFEROL), ASCORBYL PALMITATE AND BHA AND BHT AND TOCOPHEROLS (TO PRESERVE FRESHNESS), MANGANESE SULFATE, PYRIDOXINE HYDROCHLORIDE (VITAMIN B6), THIAMINE HYDROCHLORIDE, RIBOFLAVIN, CHROMIUM CHLORIDE, FOLIC ACID, BIOTIN, SODIUM SELENITE (SELENIUM), POTASSIUM IODIDE (IODINE), VITAMIN K1 (PHYTONADIONE), SODIUM MOLYBDATE (MOLYBDENUM), VITAMIN B12 (CYANOCOBALAMIN)",
        "hcpc": "B4156",
        "restrictions": "This product is only suitable for individuals greater than 3 years old",
        "image": "Tolerex.png"
    },
    {
        "id": 40,
        "title": "VIVONEX T-E-N",
        "description": "Vivonex T·E·N is a powdered, nutritionally complete, elemental formula with 100% free amino acids providing 1.0 Cal/ml with 15% protein equivalent and 3% calories from fat for severely compromised GI tract. For oral and tube feeding use.",
        "usage": "Severe protein and fat malabsorption, Extensive bowel resection, Early postoperative feeding, TPN alternative, Transition from TPN, Dual feeding with TPN",
        "ingredients": "MALTODEXTRIN (FROM CORN), MODIFIED CORNSTARCH, L-LEUCINE AND LESS THAN 2% OF L-GLUTAMINE, MAGNESIUM GLUCONATE, L-ARGININE ACETATE, L-ISOLEUCINE, L-VALINE, CALCIUM GLYCEROPHOSPHATE, SAFFLOWER OIL, L-LYSINE ACETATE, L-ASPARTIC ACID, L-ALANINE, L-PHENYALANINE, L-PROLINE, SODIUM CITRATE, POTASSIUM CITRATE, GLYCINE, L-THREONINE, L-HISTIDINE HYDROCHLORIDE, L-SERINE, L-CYSTEINE HYDROCHLORIDE, L-METHIONINE, DISODIUM PHOSPHATE, POTASSIUM CHLORIDE, CHOLINE BITARTRATE, L-TRYPTOPHAN, L-TYROSINE, ASCORBIC ACID (VITAMIN C), TAURINE, POLYSORBATE 80, L-CARNITINE, DL-ALPHATOCOPHERYL ACETATE (VITAMIN E), ZINC SULFATE, FERROUS SULFATE (IRON), NIACINAMIDE, VITAMIN A PALMITATE, CALCIUM PANTOTHENATE (PANTOTHENIC ACID), COPPER GLUCONATE, POTASSIUM SORBATE AND ASCORBYL PALMITATE AND TOCOPHEROLS AND BHA/BHT (TO HELP MAINTAIN FRESHNESS), PYRIDOXINE HYDROCHLORIDE (VITAMIN B6), MANGANESE SULFATE, VITAMIN D3 (CHOLECALCIFEROL), RIBOFLAVIN (VITAMIN B2), THIAMINE HYDROCHLORIDE (VITAMIN B1), CHROMIUM CHLORIDE, FOLIC ACID, BIOTIN, POTASSIUM IODIDE (IODINE), SODIUM MOLYBDATE (MOLYBDENUM), SODIUM SELENITE (SELENIUM), VITAMIN K1 (PHYTONADIONE), VITAMIN B12 (CYANOCOBALAMIN).",
        "hcpc": "B4154",
        "restrictions": "This product is only suitable for individuals greater than 3 years old.",
        "image": "Vivonex_TEN.png"
    },
    {
        "id": 41,
        "title": "COMPLEAT PEDIATRIC",
        "description": "Compleat Pediatric is a tube feeding formula with real food ingredients including chicken, peas, carrots, peaches, tomato, green beans, and cranberry juice for children ages 1-13 years. This formula contains a blend of fibre and protein sources, and does not contain corn or soy. For tube feeding use.",
        "usage": "Convenient alternative to homemade tube feeding, Growth failure, Short or long-term tube feeding regimens, Nutrient-rich base for home blenderized tube feeding",
        "ingredients": "WATER, BROWN RICE SYRUP, DRIED CHICKEN MEAT, CANOLA OIL, MILK PROTEIN, PEA PROTEIN ISOLATE, DRIED GREEN PEAS, MEDIUM CHAIN TRIGLYCERIDES (FROM COCONUT/AND OR PALM KERNEL OIL), TOMATO PASTE, DRIED GREEN BEANS, PEACH PURÉE CONCENTRATE, PEA FIBRE, DRIED CARROTS, CRANBERRY JUICE CONCENTRATE, ACACIA GUM, OLIGOFRUCTOSE, INULIN, SALT, ROSEMARY EXTRACT, TAURINE, L-CARNITINE, VITAMINS (BETA-CAROTENE, VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHA-TOCOPHERYL ACETATE, VITAMIN K1, SODIUM ASCORBATE, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CYANOCOBALAMIN, CHOLINE CHLORIDE), MINERALS (SODIUM CITRATE, SODIUM PHOSPHATE, POTASSIUM CITRATE, POTASSIUM CHLORIDE, POTASSIUM HYDRATE, TRICALCIUM PHOSPHATE, TRIMAGNESIUM PHOSPHATE, MAGNESIUM OXIDE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE, SODIUM SELENATE, SODIUM MOLYBDATE, CHROMIUM TRICHLORIDE), SILICON DIOXIDE, CITRIC ACID, DIMETHYLPOLYSILOXANE. ",
        "hcpc": "B4149",
        "restrictions": "CONTAINS MILK.",
        "image": "compleat-pediatric.png"
    }
]
```
5. The last filter is by MCT oil percentage. The range of low is less than 25%, medium is 25% - 50%, and the high is more than 50% MCT oil. The result returns the formula and the percentage of the formula:
    - GET "localhost:3000/api/v1/formulas?mct_lct=high"
    - https://nurish-app.herokuapp.com/api/v1/formulas?mct_lct=high
```
[
    {
        "id": 22,
        "title": "ISOSOURCE 1.5",
        "mct_lct": "50:50"
    },
    {
        "id": 26,
        "title": "MICROLOIPID",
        "mct_lct": "70:30"
    },
    {
        "id": 27,
        "title": "NOVASOURCE RENAL",
        "mct_lct": "70:30"
    },
    {
        "id": 28,
        "title": "OPTIFAST 900",
        "mct_lct": "50:50"
    },
    {
        "id": 29,
        "title": "PEPTAMEN 1.0",
        "mct_lct": "70:30"
    },
    {
        "id": 30,
        "title": "PEPTAMEN WITH PREBIO",
        "mct_lct": "50:50"
    },
    {
        "id": 43,
        "title": "MODULEN IBD",
        "mct_lct": "60:40"
    },
    {
        "id": 44,
        "title": "NUTREN JUNIOR",
        "mct_lct": "60:40"
    },
    {
        "id": 46,
        "title": "PEPTAMEN JUNIOR",
        "mct_lct": "68:32"
    }
]
```
6. The finally of app is the ability to do a universal search for all information in the formula and formula_overview table which allows users to search for certain information for all formulas:
    - GET "localhost:3000/api/v1/search?key_word=boost"
    - https://nurish-app.herokuapp.com/api/v1/search?key_word=boost
```
[
    {
        "id": 2,
        "title": "BOOST Original",
        "description": "BOOST Original is a great tasting, nutritionally complete, meal replacement that can be used as a snack or as a meal. No artificial flavours or colours. Natural source sweetener. For oral use. ",
        "usage": "Poor appetite, Involuntary weight loss, malnutrition, Reduced intake when recovering from illness or surgery, Reduced intake during and after cancer treatment, Reduced intake after oral surgery",
        "ingredients": "WATER, CORN SYRUP, MILK PROTEIN, SUGAR, VEGETABLE OILS (CANOLA, HIGH OLEIC SUNFLOWER AND CORN), SOY PROTEIN, SALT, VITAMINS (VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHA-TOCOPHERYL ACETATE, SODIUM ASCORBATE, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CHOLINE BITARTRATE), MINERALS (SODIUM CITRATE, POTASSIUM CITRATE, POTASSIUM HYDRATE, POTASSIUM CHLORIDE, CALCIUM CARBONATE, TRICALCIUM PHOSPHATE, MAGNESIUM PHOSPHATE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE, SODIUM SELENITE, SODIUM MOLYBDATE, CHROMIUM TRICHLORIDE), CELLULOSE GEL AND GUM, SOY LECITHIN, FLAVOUR, CARRAGEENAN, STEVIA EXTRACT, DIMETHYLPOLYSILOXANE.",
        "hcpc": "B4150",
        "restrictions": null,
        "image": "Boost-Original.png"
    },
    {
        "id": 3,
        "title": "BOOST Powder",
        "description": "BOOST Powder is a great tasting option, when mixed with milk or in smoothies, that provides a source of protein and other vitamins and minerals. It can be used with snacks or meals. For oral use",
        "usage": "Skipped breakfast meal,  Inadequate oral intake",
        "ingredients": "SKIM MILK POWDER, SUGAR, CORN MALTODEXTRIN, OLIGOFRUCTOSE, INULIN, LACTOSE, ARTIFICIAL FLAVOUR, CELLULOSE GUM, VITAMINS (VITAMIN A PALMITATE, ASCORBIC ACID, THIAMINE MONONITRATE, RIBOFLAVIN, NIACINAMIDE), MINERAL (FERRIC ORTHOPHOSPHATE).",
        "hcpc": "",
        "restrictions": "CONTAINS MILK, MAY CONTAIN SOY AND WHEAT",
        "image": "Boost-Powder.png"
    },
    {
        "id": 4,
        "title": "BOOST DIABETIC",
        "description": "BOOST Diabetic is a great tasting, nutritionally complete formula designed to meet the needs of people with diabetes. A unique and calorically balanced blend of protein, fat and carbohydrates. Provides 17 g of carbohydrate per serving. For oral use.",
        "usage": "Diabetes, Hyperglycemia, Glucose intolerance",
        "ingredients": "WATER, MODIFIED MILK INGREDIENTS, TAPIOCA DEXTRIN, VEGETABLE OILS (CANOLA, HIGH OLEIC SUNFLOWER, CORN), SOY PROTEIN ISOLATE, ACACIA GUM, OLIGOFRUCTOSE, INULIN, VITAMINS (VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHA-TOCOPHERYL ACETATE, SODIUM ASCORBATE, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CYANOCOBALAMIN), MINERALS (SODIUM CITRATE, POTASSIUM CITRATE, POTASSIUM HYDRATE, POTASSIUM CHLORIDE, CALCIUM PHOSPHATE, MAGNESIUM PHOSPHATE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE), CELLULOSE GEL AND GUM, SOY LECITHIN, SUCRALOSE, ARTIFICIAL FLAVOUR, CARRAGEENAN, DIMETHYLPOLYSILOXANE.",
        "hcpc": "B4154",
        "restrictions": "CONTAINS MILK AND SOY",
        "image": "Boost-Diabetic.png"
    },
    {
        "id": 5,
        "title": "BOOST HIGH PROTEIN",
        "description": "BOOST® High Protein is a great tasting, nutritionally complete formula with 15 g of protein per 237 ml that can be used as a snack or as a meal. For oral use",
        "usage": "Chewing or swallowing difficulties, Fluid or volume restrictions, Poor appetite",
        "ingredients": "WATER, CORN SYRUP, MODIFIED MILK INGREDIENTS, SUGAR, VEGETABLE OILS (CANOLA, HIGH OLEIC SUNFLOWER, CORN), SOY PROTEIN ISOLATE, SALT, VITAMINS (VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHATOCOPHERYL ACETATE, SODIUM ASCORBATE, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACIN, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CHOLINE BITARTRATE), MINERALS (POTASSIUM CITRATE, POTASSIUM HYDRATE, POTASSIUM CHLORIDE, TRICALCIUM PHOSPHATE, MAGNESIUM PHOSPHATE, MAGNESIUM CHLORIDE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE, SODIUM SELENITE, SODIUM MOLYBDATE, CHROMIUM TRICHLORIDE), ARTIFICIAL FLAVOUR, CELLULOSE GEL AND GUM, SOY LECITHIN, CARRAGEENAN, STEVIA EXTRACT, DIMETHYLPOLYSILOXANE. ",
        "hcpc": "B4150",
        "restrictions": "CONTAINS MILK AND SOY",
        "image": "Boost-HighProtein.png"
    },
    {
        "id": 6,
        "title": "BOOST PROTEIN +",
        "description": "Boost Protein +™ shake is a great tasting, nutritionally complete formula with 27 g of protein per 325 ml that can be used as a meal. For oral use",
        "usage": "Increased protein requirements when recovering from illness or surgery, Increased protein requirements during and after cancer treatment",
        "ingredients": "WATER, MILK PROTEIN, SUGAR, CORN SYRUP, COCOA, VEGETABLE OILS (CANOLA, HIGH OLEIC SUNFLOWER AND CORN), SOY PROTEIN ISOLATE, SALT, VITAMINS (VITAMIN A PALMITATE, VITAMIN D3, DLALPHA-TOCOPHERYL ACETATE, SODIUM ASCORBATE, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CHOLINE BITARTRATE), MINERALS (POTASSIUM CITRATE, MAGNESIUM PHOSPHATE, FERRIC PHOSPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE, SODIUM SELENITE, SODIUM MOLYBDATE, CHROMIUM TRICHLORIDE), CELLULOSE GEL AND GUM, SOY LECITHIN, CARRAGEENAN, SUCRALOSE, NATURAL AND ARTIFICIAL FLAVOUR, DIMETHYLPOLYSILOXANE.",
        "hcpc": "B4152",
        "restrictions": "CONTAINS MILK AND SOY.",
        "image": "Boost-Protein+.png"
    },
    {
        "id": 7,
        "title": "BOOST JUST PROTEIN",
        "description": "BOOST Just Protein™ is an unflavoured instant protein powder that is a modular whey protein source. Each 21 g serving provides 18 g of protein. It can be added to most foods, liquids and as a protein flush with tube feedings.",
        "usage": "Increased protein requirements",
        "ingredients": "WHEY PROTEIN ISOLATE [99%], SOY LECITHIN [1%].",
        "hcpc": "",
        "restrictions": "CONTAINS MILK AND SOY.",
        "image": "Boost-JustProtein.png"
    },
    {
        "id": 8,
        "title": "BOOST PLUS CALORIES",
        "description": "BOOST Plus Calories is a great tasting, nutritionally complete formula that can be used as a snack or as a meal. It provides a concentrated calorie source in a limited volume for patients with high energy needs. For oral use.",
        "usage": "Malnutrition, Involuntary weight loss, Poor appetite, Increased energy needs, Fluid restriction/volume sensitivity",
        "ingredients": "WATER, CORN SYRUP, SUGAR, MODIFIED MILK INGREDIENTS, VEGETABLE OILS (CANOLA, HIGH OLEIC SUNFLOWER, CORN), SOY PROTEIN ISOLATE, ACACIA GUM, OLIGOFRUCTOSE, INULIN, SALT, VITAMINS (VITAMIN A PALMITATE, BETA-CAROTENE, VITAMIN D3, DL-ALPHA-TOCOPHERYL ACETATE, VITAMIN K1, ASCORBIC ACID, SODIUM ASCORBATE, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CYANOCOBALAMIN, CHOLINE BITARTRATE), MINERALS (POTASSIUM CITRATE, POTASSIUM HYDRATE, POTASSIUM CHLORIDE, TRICALCIUM PHOSPHATE, DIMAGNESIUM PHOSPHATE TRIHYDRATE, MAGNESIUM CHLORIDE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE, SODIUM SELENITE, SODIUM MOLYBDATE, CHROMIUM TRICHLORIDE), SOY LECITHIN, CARRAGEENAN, ARTIFICIAL FLAVOUR, DIMETHYLPOLYSILOXANE.",
        "hcpc": "",
        "restrictions": "CONTAINS MILK AND SOY",
        "image": "Boost-PlusCalories.png"
    },
    {
        "id": 9,
        "title": "BOOST FRUIT FLAVORED BEVERAGE",
        "description": "BOOST Fruit Flavoured Beverage is a great tasting, nutritionally complete clear liquid diet oral supplement; an alternative to milky formulas. For oral use.",
        "usage": "Clear liquid diet needs, Fat malabsorption, Involuntary weight loss, Malnutrition, Reduced intake when recovering from illness or surgery, Reduced intake during and after cancer treatment, Reduced intake after oral surgery",
        "ingredients": "WATER, LIQUID SUGAR, WHEY PROTEIN ISOLATE (MILK), PHOSPHORIC ACID, MAGNESIUM GLUCONATE, CITRIC ACID, SOYBEAN OIL, CHOLINE BITARTRATE, NATURAL FLAVOUR, CALCIUM CHLORIDE, COLOUR, L-CYSTEINE, POLYGLYCEROL ESTERS OF FATTY ACIDS, MANGANESE SULPHATE, FERROUS SULPHATE (IRON), COPPER GLUCONATE, ZINC SULPHATE, VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHA TOCOPHERYL ACETATE, VITAMIN K1, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NICOTINAMIDE, PYRIDOXINE HYDROCHLORIDE, FOLIC ACID, CALCIUM PANTOTHENATE (PANTOTHENIC ACID), CYANOCOBALAMIN, BIOTIN.",
        "hcpc": "B4155",
        "restrictions": "CONTAINS MILK AND SOY.",
        "image": "Boost-FruitBeverages.png"
    },
    {
        "id": 10,
        "title": "BOOST PUDDING",
        "description": "BOOST Pudding is great tasting and nutritionally complete in a pudding format. It can be used as a snack or dessert. For oral use.",
        "usage": "Involuntary weight loss, Malnutrition, Fluid or volume restrictions, Poor appetite, Chewing or swallowing difficulties",
        "ingredients": "WATER, CORN MALTODEXTRIN, SUGAR, MODIFIED MILK INGREDIENTS, VEGETABLE OILS (CANOLA, HIGH OLEIC SUNFLOWER, CORN), MODIFIED CORN STARCH, SALT, VITAMINS (BETA-CAROTENE, VITAMIN A PALMITATE, VITAMIN D3, DL-ALPHATOCOPHERYL ACETATE, VITAMIN K1, SODIUM ASCORBATE, ASCORBIC ACID, THIAMINE HYDROCHLORIDE, RIBOFLAVIN, NIACINAMIDE, CALCIUM PANTOTHENATE, PYRIDOXINE HYDROCHLORIDE, BIOTIN, FOLIC ACID, CYANOCOBALAMIN, CHOLINE CHLORIDE), MINERALS (SODIUM PHOSPHATE, POTASSIUM CITRATE, POTASSIUM CHLORIDE, CALCIUM PHOSPHATE, MAGNESIUM PHOSPHATE, FERRIC PYROPHOSPHATE, FERROUS SULPHATE, ZINC SULPHATE, MANGANESE SULPHATE, COPPER SULPHATE, POTASSIUM IODIDE, SODIUM SELENITE, SODIUM MOLYBDATE, CHROMIUM CHLORIDE), SODIUM STEAROYL-2-LACTYLATE, NATURAL AND ARTIFICIAL FLAVOUR, CARRAGEENAN, STEVIA EXTRACT.",
        "hcpc": "B4150",
        "restrictions": "CONTAINS MILK.",
        "image": "Boost-Pudding.png"
    },
    {
        "id": 11,
        "title": "BOOST 1.5",
        "description": "BOOST 1.5 is a great tasting, nutritionally complete supplement that can be used as a snack or as a meal. It provides concentrated calories in a limited volume for patients with high energy needs. For oral use.",
        "usage": "Malnutrition, Involuntary weight loss, Poor appetite, Increased energy needs, Fluid restriction/volume sensitivity, Reduced intake when recovering from surgery or illness, Reduced intake during and after cancer treatment",
        "ingredients": "WATER, CORN SYRUP, SUGAR, SODIUM CASEINATE (FROM MILK), HIGH OLEIC SUNFLOWER OIL, SOY PROTEIN ISOLATE, CANOLA OIL, CALCIUM CASEINATE, POTASSIUM CITRATE, TRICALCIUM PHOSPHATE, NATURAL AND ARTIFICIAL FLAVOUR, SODIUM CITRATE, SOY LECITHIN, MAGNESIUM CHLORIDE, CELLULOSE GUM, MICROCRYSTALLINE CELLULOSE, CHOLINE CHLORIDE, ASCORBIC ACID, CARRAGEENAN, POTASSIUM HYDROXIDE, POTASSIUM CHLORIDE, ZINC SULPHATE, FERROUS SULPHATE (IRON), ALPHA-TOCOPHERYL ACETATE, NIACINAMIDE, CALCIUM PANTOTHENATE (PANTOTHENIC ACID), COPPER GLUCONATE, MANGANESE SULPHATE, PYRIDOXINE HYDROCHLORIDE, THIAMINE MONONITRATE, VITAMIN A PALMITATE, RIBOFLAVIN, CHROMIUM CHLORIDE, FOLIC ACID, BIOTIN, POTASSIUM IODIDE (IODINE), SODIUM MOLYBDATE (MOLYBDENUM), SODIUM SELENITE (SELENIUM), VITAMIN K1, CYANOCOBALAMIN, VITAMIN D3, DIMETHYLPOLYSILOXANE.",
        "hcpc": "",
        "restrictions": null,
        "image": "Boost-1_5.png"
    },
    {
        "id": 3,
        "title": "BOOST Powder",
        "description": "BOOST Powder is a great tasting option, when mixed with milk or in smoothies, that provides a source of protein and other vitamins and minerals. It can be used with snacks or meals. For oral use",
        "usage": "Skipped breakfast meal,  Inadequate oral intake",
        "ingredients": "SKIM MILK POWDER, SUGAR, CORN MALTODEXTRIN, OLIGOFRUCTOSE, INULIN, LACTOSE, ARTIFICIAL FLAVOUR, CELLULOSE GUM, VITAMINS (VITAMIN A PALMITATE, ASCORBIC ACID, THIAMINE MONONITRATE, RIBOFLAVIN, NIACINAMIDE), MINERAL (FERRIC ORTHOPHOSPHATE).",
        "hcpc": "",
        "restrictions": "CONTAINS MILK, MAY CONTAIN SOY AND WHEAT",
        "image": "Boost-Powder.png"
    }
]
```
