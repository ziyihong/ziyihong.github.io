from flask import Flask, request, abort, jsonify
from flask_cors import CORS

from linebot import (
    LineBotApi, WebhookHandler
)
from linebot.exceptions import (
    InvalidSignatureError
)
from linebot.models import *

import func
import bedtime_log

from urllib.parse import parse_qsl

import requests

app = Flask(__name__)
CORS(app)

# 必須放上自己的Channel Access Token
line_bot_api = LineBotApi('MojkGXeag3xXX/lf3saxP/Afl3vUVkakM9yURbhc+peIKdCNt4r2O4CSmXH1qA3SOhOGvfhKW/i99OXJCfwsbOkijoi1QWqyECNEn/TPOLNYtSCtasHb9CURY70Y8WhVCIX3iHMhloEjycZsUVHVdQdB04t89/1O/w1cDnyilFU=')
# 必須放上自己的Channel Secret
handler = WebhookHandler('d35ed1ea2e5aeace00a4e07bf9a0028e')

# 監聽所有來自 /callback 的 Post Request
@app.route("/callback", methods=['POST'])
def callback():
    # get X-Line-Signature header value
    signature = request.headers['X-Line-Signature']
    # get request body as text
    body = request.get_data(as_text=True)
    app.logger.info("Request body: " + body)
    print('THE BODY: ' + body)
    # handle webhook body
    try:
        handler.handle(body, signature)
    except InvalidSignatureError:
        abort(400)
    return 'OK'

# 處理訊息
# event.message 為 TextMessage 實例。所以此為處理 TextMessage 的 handler
@handler.add(MessageEvent, message=TextMessage)
def handle_message(event):
    if event.source.user_id != "Udeadbeefdeadbeefdeadbeefdeadbeef":
        mtext = event.message.text
        if mtext == "我想要填寫睡前日誌":
            bedtime_log.mood_record(event)
        elif mtext == "開始記錄心情":
            bedtime_log.choose_face(event)

        # 選擇心情後的回覆，之後接運動紀錄
        elif mtext == "太棒了!" or mtext == "還不錯" or mtext == "普通" or mtext == "情緒低落" or mtext == "煩躁":
            bedtime_log.exercise_record(event, mtext) 
                       
        # 運動回覆    
        elif mtext == "我今天有運動喔!" or mtext == "今天沒空!":
            bedtime_log.exercise_time(event, mtext)
        # 使用者選完運動時間後所要回覆的訊息
        elif "分鐘" in mtext or "小時" in mtext:
            message1 = TextSendMessage(text = '收到 請繼續保持良好運動習慣，我們將為您紀錄這週的生活狀況呦!')
            message2 = TextSendMessage(text = '恭喜你完成今日的睡前日誌，感謝您的填寫，祝你有個美好的夜晚!')
            line_bot_api.reply_message(event.reply_token, [message1, message2])
            
        else:
            message = TextSendMessage(text=event.message.text)
            line_bot_api.reply_message(event.reply_token, message)#讓linebot回傳你說的話(echobot)

# event.message 為 LocationMessage 實例。所以此為處理 LocationMessage 的 handler
@handler.add(MessageEvent, message=LocationMessage)
def location_message(event):
    if event.source.user_id != "Udeadbeefdeadbeefdeadbeefdeadbeef":
        func.sendWeather(event)
import os
if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
