import React from 'react'

class signUp extends React.Component {
  render() {
    return (
      <div>
        this is sign up
        <button onClick={() => this.props.history.push('/login')}>
          Click for goto login
        </button>
      </div>
    )
  }
}

export default signUp
