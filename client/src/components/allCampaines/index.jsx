import React, { useEffect, useState } from 'react';
import { Pagination, message } from 'antd';
import axios from 'axios';
import Header from '../HeaderAllCampaines';
import FilterCampaigns from '../filterCampaigns';
import Cards from '../cards';
import './style.css';

function AllCampaines() {
  const [campaigns, setCampaigns] = useState([]);
  const [search, setSearch] = useState('');
  const [category, setCategory] = useState('');
  const [available, setAvailable] = useState(true);
  const [page, setPage] = useState(1);
  const [totalCount, setTotalCount] = useState(0);

  useEffect(() => {
    const source = axios.CancelToken.source();
    const { token } = source;
    const fetchData = async () => {
      try {
        const { data: { data: { campaigns: campaignsFromDB, count } } } = await axios(`/api/campaigns?search=${search}&category=${category}&available=${available}&page=${page}&limit=6`, {
          cancelToken: token,
        });
        setTotalCount(count);
        setCampaigns(campaignsFromDB);
      } catch ({ response: { dara: { message: errorMessage } } }) {
        message.error({
          content: errorMessage,
        });
      }
    };
    fetchData();
    return () => source.cancel();
  }, [page, available, category, search]);

  const handlepageChange = (e) => {
    setPage(e);
  };
  return (
    <div className="all-campaines-container">
      <Header />
      <FilterCampaigns
        setCategory={setCategory}
        setAvailable={setAvailable}
        setSearch={setSearch}
      />

      <Cards campaigns={campaigns} />

      { totalCount > 6 ? (

        <Pagination
          className="pagination"
          defaultCurrent={page}
          total={Math.ceil(totalCount / 6)}
          defaultPageSize={1}
          onChange={(e) => handlepageChange(e)}
        />
      ) : null }

    </div>
  );
}

export default AllCampaines;
