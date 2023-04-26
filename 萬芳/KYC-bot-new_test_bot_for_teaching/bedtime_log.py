from linebot import LineBotApi
from linebot.models import *
import requests
# 必須放上自己的Channel Access Token(在Line Developers的Messaging API裡)
line_bot_api = LineBotApi('85mQXt4htM3J/LNJ9VZE8K9GjpuM4PYQQRSlkSaGixvmTLMMZ1mMHeffikAuTk/cvqt3jUbusz8Pxq9RgRolmzYXaRE+gx2SYBLIrJ0DiZyggjv5OQklrCVFNrDxF+MZ18WYKypWd7s8E5jmz9t8fwdB04t89/1O/w1cDnyilFU=')

def sendQuicklyReply(event):#Quick Reply Message
    try:
        message = TextSendMessage(
            text='來點什麼？',
            quick_reply=QuickReply(
                items=[
                    QuickReplyButton(
                        action=MessageAction(label='我想來點正餐', text='正餐!')
                    ),
                    QuickReplyButton(
                        action=MessageAction(label='來個下午茶！', text='下午茶!')
                    ),
                    QuickReplyButton(
                        action=MessageAction(label='來點飲料！', text='飲料!')
                    ),
                    QuickReplyButton(
                        action=MessageAction(label='不吃了！', text='不吃了!')
                    ),
                ]
            )
        )
        line_bot_api.reply_message(event.reply_token, message)
    except:
        line_bot_api.reply_message(event.reply_token, TextSendMessage(text='錯誤！'))

def mood_record(event):#Carousel Template Message
    #可以用line提供的flex message simulator進行編輯，並輸出成json格式，用下面方式貼上(記得要檢查json有些地方會寫true，要改成True，不然會出錯) 
    try:
        flex_message = FlexSendMessage(
                alt_text='心情紀錄',
                contents=
                {
                "type": "bubble",
                "hero": {
                    "type": "image",
                    "url": "https://img.onl/HQAgE7",
                    "size": "full",
                    "aspectRatio": "20:13",
                    "aspectMode": "fit",
                    "action": {
                    "type": "uri",
                    "uri": "http://linecorp.com/"
                    },
                    "backgroundColor": "#F9F6FB"
                },
                "body": {
                    "type": "box",
                    "layout": "vertical",
                    "contents": [
                    {
                        "type": "text",
                        "text": "心情紀錄",
                        "weight": "bold",
                        "size": "xl"
                    },
                    {
                        "type": "box",
                        "layout": "vertical",
                        "margin": "lg",
                        "spacing": "sm",
                        "contents": [
                        {
                            "type": "box",
                            "layout": "baseline",
                            "spacing": "sm",
                            "contents": [
                            {
                                "type": "text",
                                "color": "#aaaaaa",
                                "flex": 1,
                                "text": "你今天的心情如何呀?  點選下方按鈕",
                                "contents": []
                            }
                            ]
                        },
                        {
                            "type": "box",
                            "layout": "baseline",
                            "contents": [
                            {
                                "type": "text",
                                "text": "開始記錄吧 !",
                                "color": "#aaaaaa"
                            }
                            ]
                        }
                        ]
                    }
                    ]
                },
                "footer": {
                    "type": "box",
                    "layout": "vertical",
                    "spacing": "sm",
                    "contents": [
                    {
                        "type": "button",
                        "height": "sm",
                        "action": {
                        "type": "message",
                        "label": "記錄心情",
                        "text": "開始記錄心情"
                        }
                    }
                    ],
                    "flex": 0,
                    "cornerRadius": "none"
                }
                }
                )
        line_bot_api.reply_message(event.reply_token, flex_message)
    except:
        line_bot_api.reply_message(event.reply_token, TextSendMessage(text='心情紀錄錯誤！'))

def choose_face(event):
    try:
        flex_message = FlexSendMessage(
                alt_text='心情紀錄',
                contents=
                {
                "type": "carousel",
                "contents": [
                    {
                    "type": "bubble",
                    "size": "micro",
                    "hero": {
                        "type": "image",
                        "url": "https://img.onl/cDbUte",
                        "size": "full",
                        "aspectMode": "fit",
                        "aspectRatio": "320:213"
                    },
                    "footer": {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [
                        {
                            "type": "button",
                            "action": {
                            "type": "message",
                            "label": "太棒了!",
                            "text": "太棒了!"
                            },
                            "flex": 1,
                            "margin": "xs",
                            "height": "sm",
                            "style": "primary",
                            "color": "#66B3FF"
                        }
                        ]
                    }
                    },
                    {
                    "type": "bubble",
                    "size": "micro",
                    "hero": {
                        "type": "image",
                        "url": "https://img.onl/pW0ywb",
                        "size": "full",
                        "aspectMode": "fit",
                        "aspectRatio": "320:213"
                    },
                    "footer": {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [
                        {
                            "type": "button",
                            "action": {
                            "type": "message",
                            "label": "還不錯",
                            "text": "還不錯"
                            },
                            "flex": 1,
                            "margin": "xs",
                            "height": "sm",
                            "style": "primary",
                            "color": "#66B3FF"
                        }
                        ]
                    }
                    },
                    {
                    "type": "bubble",
                    "size": "micro",
                    "hero": {
                        "type": "image",
                        "url": "https://img.onl/aDWTWg",
                        "size": "full",
                        "aspectMode": "fit",
                        "aspectRatio": "320:213"
                    },
                    "footer": {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [
                        {
                            "type": "button",
                            "action": {
                            "type": "message",
                            "label": "普通",
                            "text": "普通"
                            },
                            "flex": 1,
                            "margin": "xs",
                            "height": "sm",
                            "style": "primary",
                            "color": "#66B3FF"
                        }
                        ]
                    }
                    },
                    {
                    "type": "bubble",
                    "size": "micro",
                    "hero": {
                        "type": "image",
                        "url": "https://img.onl/EUACV3",
                        "size": "full",
                        "aspectMode": "fit",
                        "aspectRatio": "320:213"
                    },
                    "footer": {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [
                        {
                            "type": "button",
                            "action": {
                            "type": "message",
                            "label": "情緒低落",
                            "text": "情緒低落"
                            },
                            "flex": 1,
                            "margin": "xs",
                            "height": "sm",
                            "style": "primary",
                            "color": "#66B3FF"
                        }
                        ]
                    }
                    },
                    {
                    "type": "bubble",
                    "size": "micro",
                    "hero": {
                        "type": "image",
                        "url": "https://img.onl/otMXKA",
                        "size": "full",
                        "aspectMode": "fit",
                        "aspectRatio": "320:213"
                    },
                    "footer": {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [
                        {
                            "type": "button",
                            "action": {
                            "type": "message",
                            "label": "煩躁",
                            "text": "煩躁"
                            },
                            "flex": 1,
                            "margin": "xs",
                            "height": "sm",
                            "style": "primary",
                            "color": "#66B3FF"
                        }
                        ]
                    }
                    }
                ]
                }
                )
        line_bot_api.reply_message(event.reply_token, flex_message)
    except:
        line_bot_api.reply_message(event.reply_token, TextSendMessage(text='選擇表情錯誤！'))

def exercise_record(event, mtext):
    try:
        if mtext == "太棒了!":
            message = TextSendMessage(text = "恭喜你! 希望你每天都保有好心情~")
        elif mtext == "還不錯":
            message = TextSendMessage(text = "收到! 希望你每天都保有好心情~")
        elif mtext == "普通":
            message = TextSendMessage(text = "謝謝您的回覆! 可以試著觀察周遭的事物，說不定會有意想不到的收穫!")
        elif mtext == "情緒低落":
            message = TextSendMessage(text = "謝謝您的回覆! 人生總有不如意的時候，試著出去走走或看個影片轉換心情吧!")
        elif mtext == "煩躁":
            message = TextSendMessage(text = "收到，可以稍微靜下心思考看看煩躁的原因，說不定會找到解決的辦法!")

        flex_message = FlexSendMessage(
                alt_text='運動紀錄',
                contents=
                {
                "type": "bubble",
                "hero": {
                    "type": "image",
                    "url": "https://img.onl/03iAZr",
                    "size": "full",
                    "aspectRatio": "20:13",
                    "aspectMode": "fit",
                    "action": {
                    "type": "uri",
                    "uri": "http://linecorp.com/"
                    },
                    "backgroundColor": "#F9F6FB"
                },
                "body": {
                    "type": "box",
                    "layout": "vertical",
                    "contents": [
                    {
                        "type": "text",
                        "text": "運動記錄",
                        "weight": "bold",
                        "size": "xl"
                    },
                    {
                        "type": "box",
                        "layout": "vertical",
                        "margin": "lg",
                        "spacing": "sm",
                        "contents": [
                        {
                            "type": "box",
                            "layout": "baseline",
                            "spacing": "sm",
                            "contents": [
                            {
                                "type": "text",
                                "color": "#aaaaaa",
                                "flex": 1,
                                "text": "你今天運動了嗎?  點選下方按鈕",
                                "contents": []
                            }
                            ]
                        },
                        {
                            "type": "box",
                            "layout": "baseline",
                            "contents": [
                            {
                                "type": "text",
                                "text": "開始記錄吧 !",
                                "color": "#aaaaaa"
                            }
                            ]
                        }
                        ]
                    }
                    ]
                },
                "footer": {
                    "type": "box",
                    "layout": "vertical",
                    "spacing": "sm",
                    "contents": [
                    {
                        "type": "button",
                        "style": "link",
                        "height": "sm",
                        "action": {
                        "type": "message",
                        "label": "我今天有運動喔!",
                        "text": "我今天有運動喔!"
                        }
                    },
                    {
                        "type": "button",
                        "style": "link",
                        "height": "sm",
                        "action": {
                        "type": "message",
                        "label": "今天沒空!",
                        "text": "今天沒空!"
                        }
                    },
                    {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [],
                        "margin": "sm"
                    }
                    ],
                    "flex": 0
                }
                }
                )
        line_bot_api.reply_message(event.reply_token, [message, flex_message])
    except:
        line_bot_api.reply_message(event.reply_token, TextSendMessage(text='運動紀錄錯誤！'))

def exercise_time(event, mtext):
    try:            
        flex_message = FlexSendMessage(
                alt_text='運動時間紀錄',
                contents=
                {
                "type": "bubble",
                "hero": {
                    "type": "image",
                    "url": "https://img.onl/L9XEED",
                    "size": "full",
                    "aspectRatio": "20:13",
                    "aspectMode": "fit",
                    "action": {
                    "type": "uri",
                    "uri": "http://linecorp.com/"
                    },
                    "backgroundColor": "#F9F6FB"
                },
                "body": {
                    "type": "box",
                    "layout": "vertical",
                    "contents": [
                    {
                        "type": "text",
                        "text": "運動時間紀錄",
                        "weight": "bold",
                        "size": "xl"
                    },
                    {
                        "type": "box",
                        "layout": "vertical",
                        "margin": "lg",
                        "spacing": "sm",
                        "contents": [
                        {
                            "type": "box",
                            "layout": "baseline",
                            "spacing": "sm",
                            "contents": [
                            {
                                "type": "text",
                                "color": "#aaaaaa",
                                "flex": 1,
                                "text": "太棒了! 那您今天運動多久呢?",
                                "contents": []
                            }
                            ]
                        }
                        ]
                    }
                    ]
                },
                "footer": {
                    "type": "box",
                    "layout": "vertical",
                    "spacing": "sm",
                    "contents": [
                    {
                        "type": "button",
                        "style": "link",
                        "height": "sm",
                        "action": {
                        "type": "message",
                        "label": "30分鐘以內",
                        "text": "30分鐘以內"
                        }
                    },
                    {
                        "type": "button",
                        "style": "link",
                        "height": "sm",
                        "action": {
                        "type": "message",
                        "label": "30分鐘~1小時",
                        "text": "30分鐘~1小時"
                        }
                    },
                    {
                        "type": "button",
                        "style": "link",
                        "height": "sm",
                        "action": {
                        "type": "message",
                        "label": "1小時~2小時",
                        "text": "1小時~2小時"
                        }
                    },
                    {
                        "type": "button",
                        "style": "link",
                        "height": "sm",
                        "action": {
                        "type": "message",
                        "label": "2小時以上",
                        "text": "2小時以上"
                        }
                    },
                    {
                        "type": "box",
                        "layout": "vertical",
                        "contents": [],
                        "margin": "sm"
                    }
                    ],
                    "flex": 0
                }
                }
                )
                
        if mtext == "我今天有運動喔!":
            message = TextSendMessage(text = '太棒了！分享一下做了哪些運動吧~')
            line_bot_api.reply_message(event.reply_token, [message, flex_message])
        elif mtext == "今天沒空!":
            message = TextSendMessage(text = '了解~ 可以點選下方選單的睡眠小幫手，每天花個幾分鐘跟著影片教學，說不定能夠讓你心情更放鬆喔!')
            line_bot_api.reply_message(event.reply_token, message)
    except:
        line_bot_api.reply_message(event.reply_token, TextSendMessage(text='運動時間紀錄錯誤！'))