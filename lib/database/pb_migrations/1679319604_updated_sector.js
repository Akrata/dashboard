migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("odiogw8die1bx0x")

  // update
  collection.schema.addField(new SchemaField({
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
      "displayFields": [
        "nombre"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("odiogw8die1bx0x")

  // update
  collection.schema.addField(new SchemaField({
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
  }))

  return dao.saveCollection(collection)
})
