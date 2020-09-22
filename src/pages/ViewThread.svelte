<script>
  import ViewThreadRow from "../components/ViewThreadRow.svelte";
  export let params;
  let comments = [];
  let pageOwner = "loading...";
  let response = fetch(
    "https://fluffyscratch.hamptonmoore.com/comments/findBy/parentID/" +
      params.id
  )
    .then((data) => data.json())
    .then((data) => {
      comments = data;
      if (data.length > 0) {
        pageOwner = data[0].profile;
      } else {
        pageOwner = "Nobody";
      }
    });
</script>

<svelte:head>
  <link
    rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossOrigin="anonymous" />
</svelte:head>

<div class="container">
  <h3>Comment thread ID {params.id} on {pageOwner}'s Profile</h3>
  <table class="table">
    <tbody>
      {#await response}
        <svelte:component
          this={ViewThreadRow}
          params={{ username: 'herohamp', text: 'The thread is loading...', date: new Date().valueOf() }} />
      {:then unused}
        {#if comments.length > 0}
          {#each comments as comment, i}
            <svelte:component this={ViewThreadRow} params={comment} />
          {/each}
        {:else}
          <svelte:component
            this={ViewThreadRow}
            params={{ username: 'herohamp', text: `I am sorry, but thread ${params.id} is not in the database`, date: new Date().valueOf() }} />
        {/if}
      {:catch error}
        <svelte:component
          this={ViewThreadRow}
          params={{ username: 'herohamp', text: `I am sorry, but there has been an error loading the data, please send the follow error message to @herohamp on Scratch. Error Message: ${error.message}`, date: new Date().valueOf() }} />
      {/await}
    </tbody>
  </table>
</div>
