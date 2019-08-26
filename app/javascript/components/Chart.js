import React from "react"
import PropTypes from "prop-types"
import {
  BarChart, Bar, Cell, XAxis, YAxis, CartesianGrid, Tooltip, Legend,
} from 'recharts';
import "./styles.css";

const Chart = (props) => {
  return (
    <BarChart
      width={800}
      height={500}
      data={ props.data }
      margin={{
        top: 5, right: 30, left: 20, bottom: 5,
      }}
      className="centered"
    >
      <CartesianGrid strokeDasharray="3 3" />
      <XAxis dataKey="name" />
      <YAxis />
      <Tooltip />
      <Legend />
      <Bar dataKey="value" fill="#fc9d03" name={ props.legend } />
    </BarChart>
  );
}

Chart.propTypes = {
  data: PropTypes.array.isRequired
};

export default Chart;
