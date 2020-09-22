<script>
  export let params;
</script>

<tr>
  <th>
    <img
      src={`https://fluffyscratch.hamptonmoore.com/user/${params.username.replace('*', '')}/profile/picture`}
      style={{ maxWidth: '64px' }}
      alt={params.username} />
  </th>
  <th>{params.username}</th>
  <td>{params.text}</td>
  <td>{new Date(params.date).toISOString()}</td>
</tr>
