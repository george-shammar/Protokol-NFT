

async function main() {
  console.log("pending");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
