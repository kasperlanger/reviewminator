import * as React from 'react'
import { useState, useEffect } from 'react'
import * as ReactDOM from 'react-dom'
import Fetch from "fetch-rails"
import {
    HashRouter as Router,
    Switch,
    Route,
    Link
} from "react-router-dom";

const App = () => {
  return <Router>
    <Link to="/material/new">New</Link>&nbsp;
    <Link to="/learning">Learning</Link>
    <Switch>
      <Route path='/material/new'><NewMaterialForm /></Route>
      <Route path='/learning'><h1>Learning</h1><MaterialList /></Route>
    </Switch>
  </Router>
}

const NewMaterialForm = (props : {}) => {
  const urlRef = React.createRef<HTMLInputElement>();
  const onSubmit = (ev : React.FormEvent) => {
    ev.preventDefault();
    const url = urlRef.current.value;
    Fetch.postJSON('/material', {url: url}, {})
  }
  return <>
    <h1>New material</h1>
    <form onSubmit={onSubmit} >
      <input ref={urlRef} autoFocus/>
    </form>
  </>
}

type Material = {url:string, id:string}

const MaterialList = () => {
  const [material, setMaterial] = useState(Array<Material>())
  const [msg, setMsg] = useState<string|null>('Loading...')
  useEffect(() => {
    Fetch.json('/material/learning', {}, {})
      .then(setMaterial)
      .then(() => setMsg(null))
      .catch((err) => setMsg("ERROR!"))
  }, [])

  if (msg) {
    return <div>{msg}</div>
  } else {
    return <>{material.map((m) => <li><a href={`/material/${m.id}`}>{m.url}</a></li>)}</>
  }
}

ReactDOM.render( <App />, document.getElementById('hello'));
