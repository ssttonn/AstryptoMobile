//
//  MarketDataModel.swift
//  AstryptoMobile
//
//  Created by sstonn on 28/12/24.
//

/*

URL: https://api.coingecko.com/api/v3/global
 
JSON Response:
 {
 "data": {
 "active_cryptocurrencies": 16346,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 1200,
 "total_market_cap": {
 "btc": 36378054.00294092,
 "eth": 1029843800.2822591,
 "ltc": 34366508211.1171,
 "bch": 7773285073.396556,
 "bnb": 4942530158.82474,
 "eos": 4376889579771.0117,
 "xrp": 1600106923677.5476,
 "xlm": 9871312817669.23,
 "link": 161028769346.59955,
 "dot": 499202062158.3868,
 "yfi": 404063448.1484073,
 "usd": 3435791173445.0205,
 "aed": 12619592264240.092,
 "ars": 3534061964630144.5,
 "aud": 5531788707222.806,
 "bdt": 410687340994929.7,
 "bhd": 1295815512647.1365,
 "bmd": 3435791173445.0205,
 "brl": 21287303162871.99,
 "cad": 4954239082549.046,
 "chf": 3099647108199.8535,
 "clp": 3412118572259984,
 "cny": 25077152616740.516,
 "czk": 83062313092737.44,
 "dkk": 24575355315858.87,
 "eur": 3295566228283.209,
 "gbp": 2732890143599.2915,
 "gel": 9620184363525.496,
 "hkd": 26669470036073.613,
 "huf": 1353883736810542.2,
 "idr": 55608280142207630,
 "ils": 12652232280387.82,
 "inr": 293364857555044.4,
 "jpy": 542422115163037.2,
 "krw": 5063661211562559,
 "kwd": 1058670334273.6143,
 "lkr": 1005071332295966.5,
 "mmk": 7208289881887652,
 "mxn": 69840014340851.6,
 "myr": 15363140232059.408,
 "ngn": 5321250295696442,
 "nok": 38930846712570.33,
 "nzd": 6096155201164.061,
 "php": 198994153183588.72,
 "pkr": 956495725005607,
 "pln": 14072072982813.973,
 "rub": 363250059421409.1,
 "sar": 12902594947405.582,
 "sek": 37799543752890.05,
 "sgd": 4668553046477.091,
 "thb": 117057120108604.44,
 "try": 120617225078287.05,
 "twd": 112774691581572.64,
 "uah": 144193115613373.12,
 "vef": 344025770197.0499,
 "vnd": 87458105494564400,
 "zar": 64340704167591.38,
 "xdr": 2634877328794.425,
 "xag": 117013186646.8696,
 "xau": 1310479469.3753998,
 "bits": 36378054002940.92,
 "sats": 3637805400294092.5
 },
 "total_volume": {
 "btc": 1695619.6907955017,
 "eth": 48002112.099264525,
 "ltc": 1601859407.3763404,
 "bch": 362321064.0006307,
 "bnb": 230376574.26580125,
 "eos": 204011466784.2704,
 "xrp": 74582681276.64342,
 "xlm": 460112362972.7092,
 "link": 7505721775.732906,
 "dot": 23268337723.97639,
 "yfi": 18833825.991785534,
 "usd": 160145871647.88373,
 "aed": 588212583645.2439,
 "ars": 164726377481155.6,
 "aud": 257842540354.93176,
 "bdt": 19142572664693.734,
 "bhd": 60399335783.742645,
 "bmd": 160145871647.88373,
 "brl": 992223784262.3756,
 "cad": 230922339622.66586,
 "chf": 144477840149.34137,
 "clp": 159042466592229.78,
 "cny": 1168872687983.5737,
 "czk": 3871622534610.5776,
 "dkk": 1145483383429.4001,
 "eur": 153609838188.31863,
 "gbp": 127382908934.41637,
 "gel": 448406999301.22955,
 "hkd": 1243092292198.7854,
 "huf": 63105957316962.59,
 "idr": 2591960932620997,
 "ils": 589733969425.8989,
 "inr": 13674047243360.969,
 "jpy": 25282870246963.625,
 "krw": 236022621142647.1,
 "kwd": 49345747430.86242,
 "lkr": 46847441085148.07,
 "mmk": 335986038717260,
 "mxn": 3255317162160.861,
 "myr": 716092265073.512,
 "ngn": 248029121632092.75,
 "nok": 1814608067266.021,
 "nzd": 284148261377.6849,
 "php": 9275328594102.129,
 "pkr": 44583280495160.914,
 "pln": 655914250884.3867,
 "rub": 16931470644025.742,
 "sar": 601403638947.0084,
 "sek": 1761876836108.5205,
 "sgd": 217606210395.1443,
 "thb": 5456156554936.051,
 "try": 5622096824511.898,
 "twd": 5256548018034.312,
 "uah": 6720994094170.674,
 "vef": 16035406128.102598,
 "vnd": 4076515081985004.5,
 "zar": 2998988480730.617,
 "xdr": 122814427653.91719,
 "xag": 5454108769.67529,
 "xau": 61082838.36393581,
 "bits": 1695619690795.5017,
 "sats": 169561969079550.16
 },
 "market_cap_percentage": {
 "btc": 54.43424213510467,
 "eth": 11.698035270053639,
 "usdt": 4.040397380739312,
 "xrp": 3.5838490679773383,
 "bnb": 2.95133470647073,
 "sol": 2.577164203098935,
 "doge": 1.3475301771121244,
 "usdc": 1.2686566935771924,
 "steth": 0.9375251704782231,
 "ada": 0.9074767174033487
 },
 "market_cap_change_percentage_24h_usd": -2.6295183118647403,
 "updated_at": 1735355953
 }
 }
 
*/

import Foundation

struct GlobalData: Codable {
    let data: MarketDataModel
}

// MARK: - MarketDataModel
struct MarketDataModel: Codable {
    let activeCryptocurrencies, upcomingIcos, ongoingIcos, endedIcos: Int
    let markets: Int
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    let updatedAt: Int

    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: {$0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}) {
            return item.value.asPercentString()
        }
        
        return ""
    }
}
