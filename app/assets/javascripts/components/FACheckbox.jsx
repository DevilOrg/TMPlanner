class FACheckbox extends React.Component {

  constructor(props) {
    super(props)

    // Define state variables
    //-------------------------------------------------------------------------
    this.state = {
      isChecked: false
    }

    // Bind methods
    //-------------------------------------------------------------------------
    Array.from([
      "_click",
      "_className"
    ]).forEach( (method) =>
      this[method] = this[method].bind(this)
    )
  }

  // Toggle checkbox
  //---------------------------------------------------------------------------
  _click() {
    this.setState({ isChecked: !this.state.isChecked })
  }

  // Return proper checkbox icon
  //---------------------------------------------------------------------------
  _className() {
    className = ["fa"]

    className.push(
      this.state.isChecked ? "fa-check-square-o" : "fa-square-o"
    )

    return className.join(' ')
  }

  // Render component
  //---------------------------------------------------------------------------
  render() {
    return (
      <div>
        <input
          type="checkbox"
          className="hidden"
          value={this.props.userId}>
        </input>

        <i
          style={{ cursor: "pointer" }}
          className={this._className()}
          onClick={this._click}>
        </i>
      </div>
    )
  }
}


