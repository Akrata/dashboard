migrate((db) => {
  const collection = new Collection({
    "id": "qc46jkuiib443ml",
    "created": "2023-03-20 13:38:29.011Z",
    "updated": "2023-03-20 13:38:29.011Z",
    "name": "sucursal",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "fuuxwf0f",
        "name": "nombre",
        "type": "text",
        "required": true,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      }
    ],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("qc46jkuiib443ml");

  return dao.deleteCollection(collection);
})
