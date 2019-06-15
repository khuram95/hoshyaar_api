import React from 'react'

class logIn extends React.Component {
  render() {
    return (
      <div>
        this is logIn page
        <button onClick={() => this.props.history.push('/')}>
          Click for goto sign up
        </button>
      </div>
    )
  }
}

export default logIn
