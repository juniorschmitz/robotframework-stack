from pymongo import MongoClient

client = MongoClient('mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=false&w=majority')
db = client['spotdb']

def remove_spot_by_company(company):
    spots = db['spots']
    spots.delete_many({'company': company})

def insert_unique_spot(spot):
    spots = db['spots']
    remove_sot_by_company(spot.company)
    return spots.insert_one(spot).inserted_id