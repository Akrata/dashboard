migrate((db) => {
  const collection = new Collection({
    "id": "odiogw8die1bx0x",
    "created": "2023-03-20 13:39:27.558Z",
    "updated": "2023-03-20 13:39:27.558Z",
    "name": "sector",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "bwftewpi",
        "name": "nombre",
        "type": "text",
        "required": true,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "w2pzk0hd",
        "name": "sucursal",
        "type": "relation",
        "required": false,
        "unique": false,
        "options": {
          "collectionId": "qc46jkuiib443ml",
          "cascadeDelete": false,
          "minSelect": null,
          "maxSelect": 1,
          "displayFields": []
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
  const collection = dao.findCollectionByNameOrId("odiogw8die1bx0x");

  return dao.deleteCollection(collection);
})
