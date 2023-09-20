import json

# Открываем JSON-файл для чтения
with open('scan_results.json', 'r') as json_file:
    # Загружаем данные из файла
    data = json.load(json_file)
to_delete = ["is_ignored", "engine_kind"]
def delete_trash(json_voc):
    for delete_key in to_delete:
        json_voc["extra"].pop(delete_key)
res = {}
for result in data["results"]:
    id = result["extra"].pop("fingerprint")
    delete_trash(result)
    # if "XSS" in result["extra"]["metadata"]["vulnerability_class"][0] or "Cross-site" in result["extra"]["metadata"]["vulnerability_class"][0]:
    res[id] = result

with open('data.json', 'w') as json_file:
    # Запишите JSON-строку в файл
    json.dump(res, json_file, indent=4)