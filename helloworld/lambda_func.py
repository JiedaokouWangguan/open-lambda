import datetime

def handler(event):
    try:
        currentDT = datetime.datetime.now()
        # return "Hello, %s!" % event['name']
        return str(currentDT) + "\n"
    except Exception as e:
        return {'error': str(e)}
