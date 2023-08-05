const express = require('express')
const app = express()
const port = 3333

app.use(express.static('public'))

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})