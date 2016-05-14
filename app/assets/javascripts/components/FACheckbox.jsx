class FACheckbox extends React.Component {

  constructor(props) {
    super(props)

    this.state = {
      isChecked: false
    }

    Array.from([
      "_check",
      "_uncheck",
      "_classNameForChecked",
      "_classNameForUnchecked"
    ]).forEach( (method) =>
      this[method] = this[method].bind(this)
    )
  }

  _check() {
    this.setState({ isChecked: true })
  }

  _uncheck() {
    this.setState({ isChecked: false })
  }

  _classNameForChecked() {
    className = "fa fa-check-square-o"

    if (!this.state.isChecked)
      className += " hidden"

    return className
  }

  _classNameForUnchecked() {
    className = "fa fa-square-o"

    if (this.state.isChecked)
      className += " hidden"

    return className
  }

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
          className={this._classNameForUnchecked()}
          onClick={this._check}>
        </i>

        <i
          style={{ cursor: "pointer" }}
          className={this._classNameForChecked()}
          onClick={this._uncheck}>
        </i>
      </div>
    );
  }
}


