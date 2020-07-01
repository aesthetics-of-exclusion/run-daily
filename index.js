const { exec } = require('child_process')
const express = require('express')
const app = express()

app.get('/', (req, res) => {
  exec('./run-daily.sh', (error, stdout, stderr) => {
    if (error) {
      res.status(500).send(error.message)
    } else if (stderr) {
      res.status(500).send(stderr)
    } else {
      res.send(stdout)
    }
  })
})

const port = process.env.PORT || 8080
app.listen(port, () => {
  console.log('run-daily listening on port', port)
})
