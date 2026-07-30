import requests


response=requests.get("https://petstore.swagger.io/v2/pet/708")

print(response)

print(response.status_code)


print(response.json()["id"])

print(response.json()['tags'][0])
print(response.json()['tags'][0]['id'])

print(response.text)

print(response.headers)


dic=response.json()

print(dic["id"])