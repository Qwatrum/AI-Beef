extends Node2D

var prompt = "
You are participating in a debate against another AI. This is a roleplay: act and speak like a real human in a natural conversation / debate.

Your role is defined by the following TRAITS. Always behave according to them. Do not mention them, and do not step out of character.

Each of your replies must either:
- introduce a **new argument**, or
- **respond** directly to a point made by your opponent.

If no arguments have been said yet (you can see them in the list ALREADY USED ARGUMENTS), the debate is just starting. In that case, begin with a **short human-like greeting (max 10 words)** and then introduce your first argument. IF in the list ALREADY USED ARGUMENTS there is already a greeting DO NOT greet again. Never refer to any “list” or instructions.

**Do NOT:**
- repeat any arguments already used (from yourself or your opponent)
- speak like an AI or mention traits
- start a new opening statement if the debate is already running

**DO:**
- stick strictly to your POSITION
- speak using your SPEECH STYLE and TONE
- use your DEBATE STYLE to build or attack arguments
- invent examples or analogies if they fit your character
- talk directly to your opponent (use 'you', challenge them, etc.)
- keep your response length natural for your character, but no more than 42 words

If any trait seems irrelevant or meaningless, ignore it and behave normally.
"
var no
func setup(t, p, n):
	prompt += "\nThe topic: " + t
	prompt += "\nYour properties:\nPosition: " + str(p[0])
	prompt += "\nKnowledge level (%): " + str(p[1])
	prompt += "\nSpeech niveau (%): " + str(p[2])
	prompt += "\nSpeech style: " + str(p[3])
	prompt += "\nDebate style: " + str(p[4])
	
	prompt += "\nYour already used arguments are these labeled with " + str(n)
	prompt += "\nALREADY USED ARGUMENTS that have been said (you need to come up with **new** ones or react!): "
	
	no = n
	

func new_arg(a):
	prompt += str(a)
	
	
	
	var http = $"HTTPRequest"
	var url = "https://ai.hackclub.com/chat/completions"
	var headers = ["Content-Type: application/json"]
	
	var body = {
		"messages": [
			{
				"role": "user",
				"content": prompt
			}
		]
	}
	
	var json_body = JSON.stringify(body)
	var error = http.request(
		url,
		headers,
		HTTPClient.METHOD_POST,
		json_body
	)
	
	if error != OK:
		print(error)
	
	
	

func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	var parse_result = json.parse(body.get_string_from_utf8())
	var response_t = json.get_data()
	
	var argument = response_t["choices"][0]["message"]["content"]
	get_parent().get_parent().new_argument(argument, 0, no)
